from dolfin import *

###### set up expressions for rhs and initial condition
#1 Initial condition and rhs by compiled expression
ic = Expression("""pow(x[0] - 0.25, 2) + pow(x[1] - 0.25, 2) < 0.2*0.2
                   ? -25.0 * ((pow(x[0] - 0.25, 2) + pow(x[1] - 0.25, 2)) - 0.2*0.2)
                   : 0.0""", degree=2)

f = Expression("""pow(x[0] - 0.75, 2) + pow(x[1] - 0.75, 2) < 0.2*0.2
                  ? 1.0*t
                  : 0.0""", t=0.0, degree=0)

