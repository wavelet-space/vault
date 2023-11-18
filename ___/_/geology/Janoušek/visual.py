# Library of routines for 2D deformation visualization
#
# Ondrej Lexa 2017

from pylab import *
# from scipy import linalg as la


class StrainEllipse:

    @classmethod
    def from_deformation(cls, F: "def_gradient"):
        """
        Visualize a strain ellipse from deformation gradient.
        """
        theta = linspace(0, 2*pi, 180)
        
        xc, yc = cos(theta), sin(theta)
        x,y = dot(F, [xc,yc])
        
        plot(xc, yc, 'r', x, y, 'g')
        
        u, s, v = svd(F)
        
        quiver(zeros(2), zeros(2),
                   hstack((s*u[0],-s*u[0])), hstack((s*u[1],-s*u[1])),
                   scale=1, units='xy')
    
    @classmethod
    def from_displacement(cls, J: "displacement gradient"):
        """
        Visualize a strain ellipse from displacement gradient.
        """
        cls.from_deformation(asarray(J) + eye(2))

    
def Square(F):
    """
    Visualize a square.
    """
    xc, yc = [-1, -1, 1, 1, -1], [-1, 1, 1, -1, -1]
    x, y = dot(F, [xc,yc])
    plot(xc, yc, 'r', x, y, 'g')

def dis_square(J):
    # Draw a square
    def_square(asarray(J) + eye(2))
    
    
class DisplacementFieldGraph:
    
    @classmethod
    def from_displacement_gradient(cls, J, **settings) -> None:
        """
        Visualize displacement field from displacement gradient.
        :param J: displacement gradient
        """
        X, Y = meshgrid(linspace(-3, 3, 21), linspace(-2, 2, 17))
        u, v = tensordot(J, [X, Y], axes=1)

        quiver(X, Y, u, v, angles='xy')
    
    @classmethod
    def from_deformation_gradient(cls, F, **settings):
        """
        Visualize displacement field deformation gradient.
        :param F: 
        """
        cls.from_displacement_gradient(asarray(F) - eye(2))
        

def dis_show(J):
    # Draw displacement field and deformation ellipse
    # from displacement gradient
    DisplacementFieldGraph(J)
    dis_square(J)
    dis_ellipse(J)
    title(f"J = [[{J[0,0]:g}, {J[0,1]:g}], [{J[1,0]:g}, {J[1,1]:g}]]")
    axis('equal')
    show()

def def_show(F):
    # Draw displacement field and deformation ellipse
    # from deformation gradient
    def_field(F)
    def_square(F)
    def_ellipse(F)
    axis('equal')
    title(f"F = [[{F[0,0]:g}, {F[0,1]:g}], [{F[1,0]:g}, {F[1,1]:g}]]")
    show()

# def vel_field(L, t=None):
#     # Visualize velocity field from spatial velocity gradient
#     X, Y = meshgrid(linspace(-2, 2, 17),
#                     linspace(-2, 2, 17))
#     u, v = tensordot(L, [X, Y], axes=1)
#     quiver(X, Y, u, v, angles='xy')
#     if t is not None:
#         F = la.expm(L*t)
#         def_square(F)
#         def_ellipse(F)
#     axis('equal', adjustable='box')
#     title('Spatial velocity gradient')
#     show()

# def densify_list_xy(x, y, n=500, per=True):
#     from scipy import interpolate
#     if per and (x[0] != x[-1]) and (x[0] != x[-1]):
#         x.append(x[0])
#         y.append(y[0])
#     tck, u = interpolate.splprep([x, y], s=0, k=1, per=per)
#     return interpolate.splev(np.linspace(0, 1, n), tck)
