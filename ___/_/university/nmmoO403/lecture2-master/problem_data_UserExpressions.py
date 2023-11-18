from dolfin import *

#2 Initial condition and rhs by python subclass expression
class RHS_f(UserExpression):
    def __init__(self, t=0.0, **kwargs):
        self.t=t
        super().__init__(**kwargs)
    def eval(self, value, x):
        r=sqrt( (x[0] - 0.75)**2 + (x[1] - 0.75)**2 )
        value[0] = 0.0
        if r<0.2 :
            value[0] = 1.0*sin(self.t)**2
    def value_shape(self):
        return ()

f = RHS_f( t=0.0, degree=0 )

class IC(UserExpression):
    def eval(self, value, x):
        r=sqrt( (x[0] - 0.25)**2 + (x[1] - 0.25)**2 )
        value[0] = 0.0
        if r<0.2 :
            value[0] = -25.0 * ((x[0] - 0.25)**2 + (x[1] - 0.25)**2 - 0.2**2 )
    def value_shape(self):
        return ()
    
ic = IC( degree=2 )
