import sys
import numpy as np
#import petsc4py
#petsc4py.init(sys.argv)

from dolfin import *

set_log_level(LogLevel.WARNING)
#set_log_level(LogLevel.INFO)
#set_log_level(LogLevel.PROGRESS)


parameters["std_out_all_processes"] = False
comm = MPI.comm_world
rank = MPI.rank(comm)


# Create mesh and build function space
mesh = UnitSquareMesh(40, 40, 'crossed')

P1=FiniteElement("CG", mesh.ufl_cell(), 1) 
V=FunctionSpace(mesh, P1)


# Create boundary markers
boundary_marks = MeshFunction('size_t', mesh , mesh.topology().dim()-1, 0)

####### set up boundary marking ##########

#####
#1 definition by subclassing SubDomain object
class TopBoundary(SubDomain):
    def inside(self, x, on_boundary):
        return on_boundary and near(x[1],1.0)

top= TopBoundary()
top.mark(boundary_marks, 3)



######
#2 using AutoSubDomain shortcut

left = AutoSubDomain(lambda x, on_boundary: on_boundary and near(x[0], 0.0))
right = AutoSubDomain(lambda x, on_boundary: on_boundary and near(x[0], 1.0))

left.mark(boundary_marks, 4)
right.mark(boundary_marks, 2)



######
#3 direct manipulation of FacetFunction
for f in facets(mesh):
    x = f.midpoint()
    if near(x[1], 0.0): boundary_marks[f] = 1


    
# save the boundary markings for paraview
with XDMFFile("results/mesh_boundary_marks.xdmf") as f :
    f.write(boundary_marks)

    
################################################################
#from problem_data_Expressions import ic, f
from problem_data_UserExpressions import ic, f


# Equation coefficients
K = Constant(1e-2) # thermal conductivity
g = Constant(0.01) # Neumann heat flux

b = Expression(  ("-(x[1] - 0.5)", "x[0] - 0.5") , degree=1) # convecting velocity

# Define domain and boundary integration measures
dx = Measure("dx", domain=mesh)
ds = Measure("ds", domain=mesh, subdomain_data=boundary_marks)
dsN = Measure("ds", domain=mesh, subdomain_data=boundary_marks, subdomain_id=1)

# Define trial and test function and solution at previous time-step
u = TrialFunction(V)
v = TestFunction(V)
u0 = Function(V)

# Time-stepping parameters
t_end = 30.0
dt = 0.1
theta = Constant(0.5) # Crank-Nicolson scheme

# Define the main part of the equation
def a(u, v):
    return( (K*inner(grad(u), grad(v)) - f*v + dot(b, grad(u))*v )*dx - g*v*dsN )

# Define time discretized equation
F = Constant(1.0/dt)*inner(u-u0, v)*dx + theta*a(u,v) + (1.0-theta)*a(u0,v)

# Define boundary condition
bc = DirichletBC(V, Constant(0.0), boundary_marks, 2)

# Prepare solution function and solver
uh = Function(V, name="temperature")
problem = LinearVariationalProblem(lhs(F), rhs(F), uh, [bc])
solver  = LinearVariationalSolver(problem)
#info(solver.parameters,True)

uh.interpolate(ic)
u0.assign(uh)

# Create file for storing results
out_file = XDMFFile("results/u.xdmf")
#info(out_file.parameters,True)
out_file.parameters['flush_output']= True
out_file.parameters['functions_share_mesh']= True
out_file.parameters['rewrite_function_mesh']= False
      
# Time-stepping
t = 0.0
# save initial solution
out_file.write(uh, t)

results=[]

while t < t_end:

    # set the new time
    t += dt
    f.t = t
    
    # Solve the problem
    solver.solve()

    # Store solution to file
    out_file.write(uh, t)
    
    # Report flux
    n = FacetNormal(mesh)
    flux = assemble(K*dot(grad(uh), n)*ds(2))
    results.append( (t, flux) )
    if rank==0 : print(f"t = {t:12f}, flux = {flux:10.2e}")

    # Move to next time step
    u0.assign(uh)
    
out_file.close()

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

results=np.array( results )
plt.plot(results[:,0], results[:,1], '-', label='heat flux')
plt.title('heat flux')
plt.xlabel('time')
plt.ylabel('flux')
plt.legend(loc=1)
plt.savefig('fig_heat_flux_vs_time.pdf', bbox_inches='tight')
