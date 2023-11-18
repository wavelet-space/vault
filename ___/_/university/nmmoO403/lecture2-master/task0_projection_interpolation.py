from dolfin import *

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt


def compare(n,k) :
        mesh = RectangleMesh(Point(0, 0), Point(1, 1), n, n, 'crossed')
        # Define function spaces

        V = FunctionSpace(mesh, "CG", k)

        # short hand notation for:
        #Pk = FiniteElement("CG", mesh.ufl_cell(), k)
        #V = FunctionSpace(mesh, Pk)

        ic= Expression("((pow(x[0]-0.5,2)+pow(x[1]-0.5,2))<0.3*0.3)?(1.0):(0.0)", domain=mesh, degree=0)

        u_interpolant = interpolate(ic,V)
        
        u_projected = project(ic,V)

        plt.figure(1, figsize=(15, 5))

        plt.subplot(1,3,1)
        ax=plot(mesh, title='mesh', color='black', lw=1)
        
        plt.subplot(1,3,2)
        ax=plot(u_interpolant, title='interpolate()')
        plt.colorbar(ax)

        plt.subplot(1,3,3)
        ax=plot(u_projected, title='project()')
        plt.colorbar(ax)
        plt.savefig('fig_project_vs_interpolate.pdf', bbox_inches='tight')
                                                                                                
compare(20,1)
