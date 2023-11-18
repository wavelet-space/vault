"""
Python module for heat modelling
    from heatlib import *
"""

from abc import ABC, abstractmethod
from itertools import groupby
import copy
import numpy as np
import matplotlib.pyplot as plt
from scipy.sparse import spdiags
from scipy.sparse.linalg import spsolve

#################################################
#            Unit helpers                       #
#################################################


class Length(float):
    unit2m = dict(mm=0.001, cm=0.01, dm=0.1, m=1, km=1000)

    def __new__(cls, val, unit):
        return float.__new__(cls, val)

    def __init__(self, val, unit):
        assert unit in Length.unit2m, 'Unknown units'
        self.unit = unit

    def __str__(self):
        return f'{float(self)} {self.unit}'

    def __repr__(self):
        return self.__str__()

    def to(self, name):
        if name in Length.unit2m:
            return Length.unit2m[self.unit] * float(self) / Length.unit2m[name]

    def __abs__(self):
        return Length.unit2m[self.unit] * float(self)


class Time(float):
    unit2s = dict(s=1, min=60, h=3600, d=24*3600, y=365.25*24*3600, ky=1e3*365.25*24*3600, Ma=1e6*365.25*24*3600)

    def __new__(cls, val, unit):
        return float.__new__(cls, val)

    def __init__(self, val, unit):
        assert unit in Time.unit2s, 'Unknown units'
        self.unit = unit

    def __str__(self):
        return f'{float(self)} {self.unit}'

    def __repr__(self):
        return self.__str__()

    def to(self, name):
        if name in Time.unit2s:
            return Time.unit2s[self.unit] * float(self) / Time.unit2s[name]

    def __abs__(self):
        return Time.unit2s[self.unit] * float(self)

#################################################
#            Tracer                             #
#################################################


class Tracer_1D:
    def __init__(self, name, x, **kwargs):
        self.name = name
        self._x = abs(x)
        self._T = None
        self.store = {}
        self.log = None
        self._store_ix = []
        self.plot_unit = kwargs.get('plot_unit', 'm')  # plotting spatial unit
        self.time_unit = kwargs.get('time_unit', 's')  # default plotting time units

    def __repr__(self):
        return f'Tracer {self.name}: x={self._x} T={self._T}'

    def record(self, model, log, init=False):
        if self._x >= 0:
            if init:
                self._T = model.get_T(self._x)
                self.store['T'] = [self._T]
                self.store['x'] = [self._x]
                self.store['time_abs'] = [0]
                self.log = [log]
            else:
                self._T = model.get_T(self._x)
                self.store['T'].append(self._T)
                self.store['x'].append(self._x)
                self.store['time_abs'].append(model._time_abs)
                self.log.append(log)

    @property
    def x_all(self):
        f = abs(Length(1, self.plot_unit))
        return np.array([x / f for x in self.store['x']])

    @property
    def x(self):
        return self.x_all[self._store_ix]

    @property
    def T_all(self):
        return np.array(self.store['T'])

    @property
    def T(self):
        return self.T_all[self._store_ix]

    @property
    def time_all(self):
        f = abs(Time(1, self.time_unit))
        return np.array([t / f for t in self.store['time_abs']])

    @property
    def time(self):
        return self.time_all[self._store_ix]

#################################################
#            Boundary conditions                #
#################################################


class Boundary_Condition(ABC):
    @abstractmethod
    def __repr__(self):
        pass


class Dirichlet_BC(Boundary_Condition):
    def __init__(self, value=0):
        self.value = value

    def __repr__(self):
        return f'Dirichlet BC: {self.value}'


class Neumann_BC(Boundary_Condition):
    def __init__(self, value=-0.02):
        self.value = value

    def __repr__(self):
        return f'Neumann BC: {self.value}'

#################################################
#            Elements                           #
#################################################


class Element:
    def __init__(self, name, **kwargs):
        self.name = name
        self.dx = float(abs(kwargs.get('dx', 1)))
        self.k = float(kwargs.get('k', 1))
        self.H = float(kwargs.get('H', 0))
        self.rho = float(kwargs.get('rho', 1))
        self.c = float(kwargs.get('c', 1))

    def __mul__(self, other):
        return [copy.copy(self) for i in range(other)]

    def __add__(self, other):
        return [self] + other

    def __rmul__(self, other):
        return self.__mul__(other)

    def __radd__(self, other):
        return other + [self]

    def __repr__(self):
        return f'|{self.name}|'

    def info(self):
        return f'{self.name}: k={self.k:g}  H={self.H:g}  rho={self.rho:g}  c={self.c:g}'

    def __eq__(self, othr):
        cmp = (self.name, self.k, self.H, self.rho, self.c) == (othr.name, othr.k, othr.H, othr.rho, othr.c)
        return (isinstance(othr, type(self)) and cmp)

    def __hash__(self):
        return hash((self.name, self.k, self.H, self.rho, self.c))

#################################################
#            Domains                            #
#################################################


class Domain_1D(ABC):
    @abstractmethod
    def __repr__(self):
        pass

    @property
    def x_units(self):
        return self.x / abs(Length(1, self.plot_unit))


class Domain_Constant_1D(Domain_1D):
    def __init__(self, **kwargs):
        self.k = kwargs.get('k', 2.5)  # conductivity
        self.H = kwargs.get('H', 0)  # heat production
        self.L = abs(kwargs.get('L', 35000))  # model length
        self.n = kwargs.get('n', 100)  # number of nodes
        self.rho = kwargs.get('rho', 2700)  # density
        self.c = kwargs.get('c', 900)  # specific heat
        self.plot_unit = kwargs.get('plot_unit', 'm')  # plotting spatial unit

    def __repr__(self):
        return f'Domain_Constant_1D: ({self.n} nodes)'

    def info(self):
        return '\n'.join([f'Domain size: {self.L} with {self.n} nodes.',
                          f'k={self.k:g} H={self.H:g} rho={self.rho:g} c={self.c:g}'])

    @property
    def dx(self):
        return self.L / (self.n - 1)

    @property
    def x(self):
        return np.linspace(0, self.L, self.n)

    def show(self):
        plt.plot(np.ones_like(self.x_units), -self.x_units, 'k.-')
        plt.ylabel(f'Depth [{self.plot_unit}]')
        plt.xlabel(f'k={self.k:g} H={self.H:g} rho={self.rho:g} c={self.c:g}')
        plt.title(self)
        plt.show()


class Domain_Variable_1D(Domain_1D):
    def __init__(self, elements, **kwargs):
        self.elements = elements
        self.plot_unit = kwargs.get('plot_unit', 'm')  # plotting spatial unit

    def __repr__(self):
        return f'Domain_Variable_1D: ({len(self.elements)} elements)'

    def info(self):
        res = []
        for e, blk in groupby(self.elements):
            n = len(list(blk))
            res.append(f'{e.dx * n} {n} {e.info()}')
        return '\n'.join(res)

    @property
    def n(self):
        return len(self.elements) + 1

    @property
    def x(self):
        return np.hstack((0, np.cumsum([e.dx for e in self.elements])))

    @property
    def xm(self):
        return np.cumsum([e.dx for e in self.elements]) - np.array([e.dx / 2 for e in self.elements])

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
        plt.ylabel(f'Depth [{self.plot_unit}]')
        plt.title(prop)
        plt.show()

#################################################
#            Models                             #
#################################################


class Model_1D(ABC):
    @abstractmethod
    def __init__(self, **kwargs):
        assert isinstance(
            self.bc0, Boundary_Condition
        ), 'Second argument must be Boundary_Condition.'
        assert isinstance(
            self.bc1, Boundary_Condition
        ), 'Third argument must be Boundary_Condition.'
        self.time_unit = kwargs.get('time_unit', 's')  # default plotting time units
        self.T = None
        self._time_abs = 0.0

    @property
    def time(self):
        return self._time_abs / abs(Time(1, self.time_unit))

    def get_T(self, x):
        if self.T is not None:
            return np.interp(abs(x), self.domain.x, self.T)
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
        print(self.domain.info())
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

#################################################
#            Solvers                            #
#################################################


class Solver_1D(ABC):
    def __init__(self, **kwargs):
        self.log = kwargs.get('log', False)

    @abstractmethod
    def solve(self, model, tracers=None):
        pass

    def tracers(self, model, tracers, init=False):
        if tracers is not None and self.log:
            for tracer in tracers:
                tracer.record(model, type(self).__name__, init)


class SetTemperature_1D(Solver_1D):
    def __init__(self, **kwargs):
        self.xmin = abs(kwargs.get('xmin', 0))
        self.xmax = abs(kwargs.get('xmax', np.inf))
        self.value = kwargs.get('value', 0)
        super().__init__(**kwargs)

    def solve(self, model, tracers=None):
        idx = (model.domain.x >= self.xmin) & (model.domain.x <= self.xmax)
        model.T[idx] = self.value
        super().tracers(model, tracers)


class Deform_Constant_1D(Solver_1D):
    def __init__(self, **kwargs):
        self.factor = kwargs.get('factor', 1)
        self.steps = kwargs.get('steps', 1)
        super().__init__(**kwargs)

    def solve(self, model, tracers=None):
        for i in range(self.steps):
            model.domain.L *= self.factor
            if tracers is not None:
                for tracer in tracers:
                    tracer._x *= self.factor
        super().tracers(model, tracers)


class Shift_Constant_1D(Solver_1D):
    def __init__(self, **kwargs):
        self.amount = kwargs.get('amount', 0)
        self.steps = kwargs.get('steps', 1)
        super().__init__(**kwargs)

    def solve(self, model, tracers=None):
        for i in range(self.steps):
            L = model.domain.L + self.amount
            model.T = np.interp(np.linspace(0, L, model.domain.n), model.domain.x + self.amount, model.T)
            model.domain.L = L
            if tracers is not None:
                for tracer in tracers:
                    tracer._x += self.amount
        super().tracers(model, tracers)


class SteadyState_Constant_1D(Solver_1D):
    def solve(self, model, tracers=None):
        if model.bc0 is not None and model.bc1 is not None:
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
            super().tracers(model, tracers, init=True)


class BTCS_Constant_1D(Solver_1D):
    def __init__(self, **kwargs):
        self.dt = abs(kwargs.get('dt', 1))
        self.steps = kwargs.get('steps', 1)
        super().__init__(**kwargs)

    def solve(self, model, tracers=None):
        if model.T is not None:
            d = np.ones(model.domain.n)
            kappa = model.domain.k / (model.domain.rho * model.domain.c)    # diffusivity
            # coeficient matrix A
            u = kappa * self.dt / model.domain.dx ** 2
            A = spdiags([-d*u, 1 + 2*d*u, -d*u], [-1, 0, 1], model.domain.n, model.domain.n, 'csr')
            # Column vector of constant terms
            b = d * model.domain.H * self.dt / (model.domain.rho * model.domain.c)
            # Top BC
            if isinstance(model.bc0, Dirichlet_BC):
                A[0, :2] = [1, 0]
                b[0] = model.bc0.value
                gamma_b0 = 0
            else:  # NEED FIX
                A[0, :2] = [-2, 2]
                b[0] -= 2 * model.bc0.value * model.domain.dx / model.domain.k
                gamma_b0 = 1
            # Bottom BC
            if isinstance(model.bc1, Dirichlet_BC):
                A[-1, -2:] = [0, 1]
                b[-1] = model.bc1.value
                gamma_b1 = 0
            else:
                A[-1, -2:] = [-2*u, 1 + 2*u]
                b[-1] -= 2 * self.dt * model.bc1.value / (model.domain.rho * model.domain.c * model.domain.dx)
                gamma_b1 = 1
            # Solve system
            m = np.hstack((gamma_b0, np.ones(model.domain.n - 2), gamma_b1))
            for i in range(self.steps):
                model.T = spsolve(A, b + m * model.T)
                model._time_abs += self.dt
            super().tracers(model, tracers)


class Deform_Variable_1D(Solver_1D):
    def __init__(self, **kwargs):
        self.factor = kwargs.get('factor', 1)
        self.steps = kwargs.get('steps', 1)
        super().__init__(**kwargs)

    def solve(self, model, tracers=None):
        for i in range(self.steps):
            for e in model.domain.elements:
                e.dx *= self.factor
            if tracers is not None:
                for tracer in tracers:
                    tracer._x *= self.factor
        super().tracers(model, tracers)


class SteadyState_Variable_1D(Solver_1D):
    def solve(self, model, tracers=None):
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
            else:  # Neumann
                A[0, :2] = [-2*model.domain.k[0], 2*model.domain.k[0]]
                b[0] = -2*model.bc0.value * model.domain.dx[0] - model.domain.H[0] * model.domain.dx[0]**2

            if isinstance(model.bc1, Dirichlet_BC):
                A[-1, -2:] = [0, 1]
                b[-1] = model.bc1.value
            else:  # Neumann
                A[-1, -2:] = [2*model.domain.k[-1], -2*model.domain.k[-1]]
                b[-1] = 2*model.bc1.value * model.domain.dx[-1] - model.domain.H[-1]*model.domain.dx[-1]**2
            # solution
            model.T = spsolve(A, b)
            model._time_abs = 0.0
            super().tracers(model, tracers, init=True)


class BTCS_Variable_1D(Solver_1D):
    def __init__(self, **kwargs):
        self.dt = abs(kwargs.get('dt', 1))
        self.steps = kwargs.get('steps', 1)
        super().__init__(**kwargs)

    def solve(self, model, tracers=None):
        if model.T is not None:
            kl, kr = model.domain.k[:-1], model.domain.k[1:]
            Hl, Hr = model.domain.H[:-1], model.domain.H[1:]
            dxl, dxr = model.domain.dx[:-1], model.domain.dx[1:]
            rl, rr = model.domain.rho[:-1], model.domain.rho[1:]
            cl, cr = model.domain.c[:-1], model.domain.c[1:]
            alfa = kl * (1 + dxr / dxl)
            beta = kr * (1 + dxl / dxr)
            gama = (cl*rl*dxr**2 + dxl*dxr*(cl*rr + cr*rl) + cr*rr*dxl**2) / (2*self.dt)
            delta = (Hl*dxr**2 + dxl*dxr*(Hl + Hr) + Hr*dxl**2) / 2
            # Sparse coefficient matrix and column vector
            dl = np.hstack((-alfa, 1, 0))
            dm = np.hstack((1, alfa + beta + gama, 1))
            dr = np.hstack((0, 1, -beta))
            # Sparse coefficient matrix A
            A = spdiags([dl, dm, dr], [-1, 0, 1], model.domain.n, model.domain.n, 'csr')
            # Column vector of constant terms
            b = np.hstack((0, delta, 0))
            # Boundary conditions
            if isinstance(model.bc0, Dirichlet_BC):
                A[0, :2] = [1, 0]
                b[0] = model.bc0.value
                gamma_b0 = 0
            else:  # Neumann
                gamma_b0 = model.domain.c[0]*model.domain.rho[0]*model.domain.dx[0]**2/self.dt
                A[0, :2] = [gamma_b0 + 2*model.domain.k[0], -2*model.domain.k[0]]
                b[0] = -model.domain.H[0]*model.domain.dx[0]**2 + 2*model.domain.dx[0]*model.bc0.value
            if isinstance(model.bc1, Dirichlet_BC):
                A[-1, -2:] = [0, 1]
                b[-1] = model.bc1.value
                gamma_b1 = 0
            else:  # Neumann
                gamma_b1 = model.domain.c[-1]*model.domain.rho[-1]*model.domain.dx[-1]**2/self.dt
                A[-1, -2:] = [-2*model.domain.k[-1], gamma_b1 + 2*model.domain.k[-1]]
                b[-1] = -model.domain.H[-1]*model.domain.dx[-1]**2 - 2*model.domain.dx[-1]*model.bc1.value
            # Calculate solution of next time step(s)
            m = np.hstack((gamma_b0, gama, gamma_b1))
            for i in range(self.steps):
                model.T = spsolve(A, b + m * model.T)
                model._time_abs += self.dt
            super().tracers(model, tracers)

#################################################
#            Simulation                         #
#################################################


class Simulation_1D:
    def __init__(self, model, init_solvers, sim_solvers, **kwargs):
        # args
        self.model = model
        if isinstance(init_solvers, Solver_1D):
            self.init_solvers = [init_solvers]
        else:
            self.init_solvers = init_solvers
        if isinstance(sim_solvers, Solver_1D):
            self.sim_solvers = [sim_solvers]
        else:
            self.sim_solvers = sim_solvers
        tracers = kwargs.get('tracers', None)
        if isinstance(tracers, Tracer_1D):
            self.tracers = [tracers]
        else:
            self.tracers = tracers
        # kwargs
        self.repeat = kwargs.get('repeat', 1)
        # init
        self._sols = []

    def time_steps(self):
        return np.array([sol['time_abs'] / abs(Time(1, self.model.time_unit)) for sol in self._sols])

    def plot(self, **kwargs):
        solutions = kwargs.pop('solutions', range(len(self._sols)))
        fig, ax = plt.subplots(**kwargs)
        for sol in solutions:
            T = self._sols[sol]['T']
            x = self._sols[sol]['x'] / abs(Length(1, self.model.domain.plot_unit))
            tm = self._sols[sol]['time_abs'] / abs(Time(1, self.model.time_unit))
            lbl = f"{tm:g}"
            ax.plot(T, -x, label=lbl)
            ax.set_xlabel('Temperature [°C]')
            ax.set_ylabel(f'Depth [{self.model.domain.plot_unit}]')
            ax.legend(loc='best', title=f'Time [{self.model.time_unit}]')
        plt.show()

    def run(self):
        # Init solvers
        for s in self.init_solvers:
            s.solve(self.model, tracers=self.tracers)
        self._sols.append(dict(time_abs=self.model._time_abs,
                               x=self.model.domain.x.copy(),
                               T=self.model.T.copy()
                               ))
        if self.tracers is not None:
            for tracer in self.tracers:
                tracer._store_ix.append(len(tracer.store['time_abs']) - 1)
        # main simulation loop
        for i in range(self.repeat):
            for s in self.sim_solvers:
                s.solve(self.model, tracers=self.tracers)
            self._sols.append(dict(time_abs=self.model._time_abs,
                                   x=self.model.domain.x.copy(),
                                   T=self.model.T.copy()
                                   ))
            if self.tracers is not None:
                for tracer in self.tracers:
                    tracer._store_ix.append(len(tracer.store['time_abs']) - 1)
        print('Done.')

