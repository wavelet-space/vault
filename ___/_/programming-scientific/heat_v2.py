'''
Python module for heat modelling
'''

from abc import ABC, abstractmethod
from collections import Counter

import numpy as np
import matplotlib.pyplot as plt
from scipy.sparse import spdiags
from scipy.sparse.linalg import spsolve


m2unit = dict(mm=0.001, cm=0.01, dm=0.1, m=1, km=1000)
s2unit = dict(s=1, m=60, h=3600, d=24*3600, y=365.25*24*3600, ky=1e3*365.25*24*3600, Ma=1e6*365.25*24*3600)


class BoundaryCondition(ABC):
    def __init__(self, value=0):
        self._value = value

    @property
    def value(self):
        return self._value

    @value.setter
    def value(self, value):
        self._value = value

    def __repr__(self):
        return f'{self.__class__.__name__}: {self.value}'


class Dirichlet(BoundaryCondition):
    def __repr__(self):
        return f'Dirichlet BC: {self.value}'


class Neumann(BoundaryCondition):
    def __init__(self, value=-0.02):
        self.value = value

    def __repr__(self):
        return f'Neumann BC: {self.value}'


class Element:
    def __init__(self, name, **kwargs):
        self.name = name
        self.dx = float(kwargs.get('dx', 1))
        self.k = float(kwargs.get('k', 1))
        self.H = float(kwargs.get('H', 0))
        self.rho = float(kwargs.get('rho', 1))
        self.c = float(kwargs.get('c', 1))

    def __mul__(self, other):
        return other * [self]

    def __add__(self, other):
        return [self] + other

    def __rmul__(self, other):
        return self.__mul__(other)

    def __radd__(self, other):
        return other + [self]

    def __repr__(self):
        return f'|{self.name}|'

    def info(self):
        return f'{self.name}: dx={self.dx:g}  k={self.k:g}  H={self.H:g}  rho={self.rho:g}  c={self.c:g}'


class Domain_1D(ABC):
    @abstractmethod
    def __repr__(self):
        pass

    @property
    def x_units(self):
        return self.x / m2unit[self.plot_unit]

    def info(self):
        print(self)


class Domain_Constant_1D(Domain_1D):
    def __init__(self, **kwargs):
        self.k = kwargs.get('k', 2.5)  # conductivity
        self.H = kwargs.get('H', 0)  # heat production
        self.L = kwargs.get('L', 35000)  # model length
        self.n = kwargs.get('n', 100)  # number of nodes
        self.rho = kwargs.get('rho', 2700)  # density
        self.c = kwargs.get('c', 900)  # specific heat
        self.plot_unit = kwargs.get('s_unit', 'm')  # default spatial units for plotting

    def __repr__(self):
        return '\n'.join([f'Domain size: {self.L / m2unit[self.plot_unit]:g}{self.plot_unit} with {self.n} nodes.',
                          f'k={self.k:g} H={self.H:g} rho={self.rho:g} c={self.c:g}'])

    @property
    def dx(self):
        return self.L / (self.n - 1)

    @property
    def x(self):
        return np.linspace(0, self.L, self.n)

    def show(self):
        plt.plot(np.ones_like(self.x_units), -self.x_units, 'k.-')
        plt.title(self)
        plt.show()


class Domain_Variable_1D(Domain_1D):
    def __init__(self, elements, **kwargs):
        self.elements = elements
        self.plot_unit = kwargs.get('s_unit', 'm')  # default spatial units for plotting

    def __repr__(self):
        res = []
        for el, n in Counter(self.elements).items():
            tot = sum(map(lambda x: x.dx, filter(lambda x: x == el, self.elements)))
            res.append(f'{n} {el} {tot / m2unit[self.plot_unit]:g}{self.plot_unit}')
        return '\n'.join(res)

    @property
    def n(self):
        return len(self.elements) + 1

    @property
    def x(self):
        return np.hstack((0, np.cumsum([e.dx for e in self.elements])))

    @property
    def xm(self):
        return np.cumsum([e.dx for e in self.elements]) - np.array([e.dx/2 for e in self.elements])

    @property
    def dx(self):
        return np.array([e.dx for e in self.elements])

    @property
    def k(self):
        return np.array([e.k for e in self.elements])

    @property
    def H(self):
        return np.array([e.H for e in self.elements])

    @property
    def rho(self):
        return np.array([e.rho for e in self.elements])

    @property
    def c(self):
        return np.array([e.c for e in self.elements])

    def show(self, prop='k'):
        x = [np.zeros_like(self.x), np.ones_like(self.x)]
        y = [-self.x_units, -self.x_units]
        plt.pcolor(x, y, np.atleast_2d(getattr(self, prop)), shading='flat')
        plt.colorbar()
        plt.ylabel(f'x [{self.plot_unit}]')
        plt.title(prop)
        plt.show()


class Model_1D(ABC):

    @abstractmethod
    def __init__(self, **kwargs):
        # Pozor, assert funguje jen v debug módu.
        # Pokud spouštíme aplikaci v -O or -OO
        assert isinstance(self.bc0, BoundaryCondition), 'Second argument must be Boundary_Condition.'
        assert isinstance(self.bc1, BoundaryCondition), 'Third  argument must be Boundary_Condition.'

        self.time_unit = kwargs.get('t_unit', 's')  # default time units for time-stepping and plotting
        self.T = None
        self._time_abs = 0.0

    @property
    def time(self):
        return self._time_abs / s2unit[self.time_unit]

    def get_T(self, x):
        if self.T is not None:
            return np.interp(x * m2unit[self.domain.plot_unit], self.domain.x, self.T)
        else:
            print('Model has not yet solution.')
            return None

    def __repr__(self):
        if self.T is None:
            return 'No solutions. Ready for initial one.'
        elif self._time_abs == 0.0:
            return 'Model with initial solution'
        else:
            return f'Model with evolutionary solution for time {self.time:g}{self.time_unit}'

    def info(self):
        print(self.bc0)
        print(self.domain)
        print(self.bc1)

    def solve(self, solver):
        assert isinstance(
            solver, Solver_1D
        ), 'You have to use Solver_1D instance as argument.'
        solver.solve(self)

    def plot(self):
        if self.T is not None:
            fig, ax = plt.subplots(figsize=(9, 6))
            ax.plot(self.T, -self.domain.x_units, label=f't={self.time:g}{self.time_unit}')
            ax.set_xlabel('Temperature [°C]')
            ax.set_ylabel(f'Depth [{self.domain.plot_unit}]')
            ax.legend(loc='best')
            plt.show()
        else:
            print('Model has not yet any solution.')


class Model_Constant_1D(Model_1D):
    def __init__(self, domain, bc0, bc1, **kwargs):
        assert isinstance(
            domain, Domain_Constant_1D
        ), 'You have to use Domain_Constant_1D instance as argument.'
        self.domain = domain
        self.bc0 = bc0
        self.bc1 = bc1
        super().__init__(**kwargs)


class Model_Variable_1D(Model_1D):
    def __init__(self, domain, bc0, bc1, **kwargs):
        assert isinstance(
            domain, Domain_Variable_1D
        ), 'You have to use Domain_Variable_1D instance as argument.'
        self.domain = domain
        self.bc0 = bc0
        self.bc1 = bc1
        super().__init__(**kwargs)

    @property
    def Tm(self):
        if self.T is not None:
            return np.interp(self.domain.xm, self.domain.x, self.T[-1])
        else:
            print('Model has not yet solution.')


class Solver_1D(ABC):

    @abstractmethod
    def solve(self, model):
        pass


class DefineTemperature_1D(Solver_1D):
    def __init__(self, **kwargs):
        self.xmin = kwargs.get('xmin', -np.inf)
        self.xmax = kwargs.get('xmax', np.inf)
        self.value = kwargs.get('value', 0)

    def solve(self, model):
        idx = (model.domain.x >= self.xmin) & (model.domain.x <= self.xmax)
        model.T[idx] = self.value


class SteadyState_Constant_1D(Solver_1D):

    def solve(self, model):
        d = np.ones(model.domain.n)
        A = spdiags([d, -2 * d, d], [-1, 0, 1], model.domain.n, model.domain.n, 'csr')
        # Column vector of constant terms
        b = -d * model.domain.H * model.domain.dx ** 2 / model.domain.k
        # Top BC
        if isinstance(model.bc0, Dirichlet_BC):
            A[0, :2] = [1, 0]
            b[0] = model.bc0.value
        else:
            A[0, :2] = [-2, 2]
            b[0] -= 2 * model.bc0.value * model.domain.dx / model.domain.k
        # Bottom BC
        if isinstance(model.bc1, Dirichlet_BC):
            A[-1, -2:] = [0, 1]
            b[-1] = model.bc1.value
        else:
            A[-1, -2:] = [2, -2]
            b[-1] += 2 * model.bc1.value * model.domain.dx / model.domain.k
        # Solve system
        model.T = spsolve(A, b)
        model._time_abs = 0.0


class BTCS_Constant_1D(Solver_1D):
    def __init__(self, **kwargs):
        self.dt = kwargs.get('dt', 1)
        self.repeat = kwargs.get('repeat', 1)

    def solve(self, model):
        if model.T is not None:
            abs_dt = self.dt * s2unit[model.time_unit]
            d = np.ones(model.domain.n)
            kappa = model.domain.k / (model.domain.rho * model.domain.c)    # diffusivity
            # coeficient matrix A
            u = kappa * abs_dt / model.domain.dx ** 2
            A = spdiags([-d*u, 1+2*d*u, -d*u], [-1, 0, 1], model.domain.n, model.domain.n, 'csr')
            # Column vector of constant terms
            b = d * model.domain.H * abs_dt / (model.domain.rho * model.domain.c)
            # Top BC
            if isinstance(model.bc0, Dirichlet_BC):
                A[0, :2] = [1, 0]
                b[0] = model.bc0.value
            else: ## NEED FIX
                A[0, :2] = [-2, 2]
                b[0] -= 2 * model.bc0.value * model.domain.dx / model.domain.k
            # Bottom BC
            if isinstance(model.bc1, Dirichlet_BC):
                A[-1, -2:] = [0, 1]
                b[-1] = model.bc1.value
            else:
                A[-1, -2:] = [-2*u, 1 + 2*u]
                b[-1] -= 2 * abs_dt * model.bc1.value / (model.domain.rho * model.domain.c * model.domain.dx)
            # Solve system
            for i in range(self.repeat):
                model.T = spsolve(A, b + model.T)
                model._time_abs += abs_dt


class SteadyState_Variable_1D(Solver_1D):

    def solve(self, model):
        if model.bc0 is not None and model.bc1 is not None:
            kl, kr = model.domain.k[:-1], model.domain.k[1:]
            Hl, Hr = model.domain.H[:-1], model.domain.H[1:]
            dxl, dxr = model.domain.dx[:-1], model.domain.dx[1:]
            alfa, beta = kl / dxl, kr / dxr
            dl = np.hstack((alfa, 1, 0))
            dm = np.hstack((1, -(alfa + beta), 1))
            dr = np.hstack((0, 1, beta))
            # Sparse coefficient matrix
            A = spdiags([dl, dm, dr], [-1, 0, 1], model.domain.n, model.domain.n, 'csr')
            # Column vector of constant terms and BC
            b = np.hstack((0, -(dxr*Hl + dxl*Hr) / 2, 0))
            # Boundary conditions
            if isinstance(model.bc0, Dirichlet_BC):
                A[0, :2] = [1, 0]
                b[0] = model.bc0.value
            else: # Neumann
                A[0, :2] = [-2*model.domain.k[0], 2*model.domain.k[0]]
                b[0] = -2*model.bc0.value * model.domain.dx[0] - model.domain.H[0] * model.domain.dx[0]**2

            if isinstance(model.bc1, Dirichlet_BC):
                A[-1, -2:] = [0, 1]
                b[-1] = model.bc1.value
            else: # Neumann
                A[-1, -2:] = [2*model.domain.k[-1], -2*model.domain.k[-1]]
                b[-1] = 2*model.bc1.value * model.domain.dx[-1] - model.domain.H[-1]*model.domain.dx[-1]**2
            # solution
            model.T = spsolve(A, b)
            model._time_abs = 0.0


class BTCS_Variable_1D(Solver_1D):
    def __init__(self, **kwargs):
        self.dt = kwargs.get('dt', 1)
        self.repeat = kwargs.get('repeat', 1)

    def solve(self, model):
        if model.T is not None:
            abs_dt = self.dt * s2unit[model.time_unit]
            kl, kr = model.domain.k[:-1], model.domain.k[1:]
            Hl, Hr = model.domain.H[:-1], model.domain.H[1:]
            dxl, dxr = model.domain.dx[:-1], model.domain.dx[1:]
            rl, rr = model.domain.rho[:-1], model.domain.rho[1:]
            cl, cr = model.domain.c[:-1], model.domain.c[1:]
            alfa = kl * (1 + dxr / dxl)
            beta = kr * (1 + dxl / dxr)
            gama = (cl*rl*dxr**2 + dxl*dxr*(cl*rr + cr*rl) + cr*rr*dxl**2) / (2*abs_dt)
            delta = (Hl*dxr**2 + dxl*dxr*(Hl + Hr) + Hr*dxl**2) / 2
            # Sparse coefficient matrix and column vector
            dl = np.hstack((-alfa, 1, 0))
            dm = np.hstack((1, alfa + beta + gama, 1))
            dr = np.hstack((0, 1, -beta))
            # Sparse coefficient matrix A
            A = spdiags([dl, dm, dr], [-1,0,1], model.domain.n, model.domain.n, 'csr')
            # Column vector of constant terms
            b = np.hstack((0, delta, 0))
            # Boundary conditions
            if isinstance(model.bc0, Dirichlet_BC):
                A[0, :2] = [1, 0]
                b[0] = model.bc0.value
                gamma_b0 = 0
            else: # Neumann
                gamma_b0 = model.domain.c[0]*model.domain.rho[0]*model.domain.dx[0]**2/abs_dt
                A[0, :2] = [gamma_b0 + 2*model.domain.k[0], -2*model.domain.k[0]]
                b[0] = -model.domain.H[0]*model.domain.dx[0]**2 + 2*model.domain.dx[0]*model.bc0.value
            if isinstance(model.bc1, Dirichlet_BC):
                A[-1, -2:] = [0, 1]
                b[-1] = model.bc1.value
                gamma_b1 = 0
            else: # Neumann
                gamma_b1 = model.domain.c[-1]*model.domain.rho[-1]*model.domain.dx[-1]**2/abs_dt
                A[-1, -2:] = [-2*model.domain.k[-1], gamma_b1 + 2*model.domain.k[-1]]
                b[-1] = -model.domain.H[-1]*model.domain.dx[-1]**2 - 2*model.domain.dx[-1]*model.bc1.value
            # Calculate solution of next time step(s)
            m = np.hstack((gamma_b0, gama, gamma_b1))
            for i in range(self.repeat):
                model.T = spsolve(A, b + m * model.T)
                model._time_abs += abs_dt


class Simulation_1D:

    def __init__(self, model, init_solvers, sim_solvers, **kwargs):
        self.model = model
        if isinstance(init_solvers, Solver_1D):
            self.init_solvers = [init_solvers]
        else:
            self.init_solvers = init_solvers
        if isinstance(sim_solvers, Solver_1D):
            self.sim_solvers = [sim_solvers]
        else:
            self.sim_solvers = sim_solvers
        self.steps = kwargs.get('steps', 1)
        self._sols = []

    def time_steps(self):
        return np.array([sol['time'] for sol in self._sols])

    def all_T(self):
        return np.array([sol['T'] for sol in self._sols])

    def plot(self, **kwargs):
        steps = kwargs.pop('steps', range(len(self._sols)))
        fig, ax = plt.subplots(**kwargs)
        for step in steps:
            ax.plot(self._sols[step]['T'], -self.model.domain.x_units, label=f"t={self._sols[step]['time']:g}{self.model.time_unit}")
            ax.set_xlabel('Temperature [°C]')
            ax.set_ylabel(f'Depth [{self.model.domain.plot_unit}]')
            ax.legend(loc='best')
        plt.show()

    def run(self):
        for s in self.init_solvers:
            s.solve(self.model)
        self._sols.append(dict(time=self.model.time, T=self.model.T.copy()))

        for i in range(self.steps):
            for s in self.sim_solvers:
                s.solve(self.model)
            self._sols.append(dict(time=self.model.time, T=self.model.T.copy()))
        print('Done.')


if __name__ == "__main__":

    # from heatlib import *

    #  Constant properties

    d = Domain_Constant_1D(H=1e-6, plot_unit='km')

    tbc = Dirichlet(0)
    bbc = Neumann(-0.02)

    m = Model_Constant_1D(d, tbc, bbc, t_unit='y')
    # m.alter_T((d.x >= 10000) & (d.x <= 15000), 700)
    m.btcs(5000)
    m.plot()

    # Variable properties

    uc = Element('UC', dx=100, k=2.5, H=3e-6, rho=2700, c=900)
    mc = Element('MC', dx=100, k=2.3, H=1e-6, rho=2800, c=800)
    lc = Element('LC', dx=100, k=2, rho=2900, c=700)

    d = Domain_Variable_1D(150*uc + 100*mc + 100*lc, s_unit='km')
    tbc = Dirichlet_BC(0)
    bbc = Neumann_BC(-0.02)

    m = Model_Variable_1D(d, tbc, bbc, t_unit='y')
    # m.alter_T((d.x >= 10000) & (d.x <= 15000), 700)
    m.btcs(5000)
    m.plot()
