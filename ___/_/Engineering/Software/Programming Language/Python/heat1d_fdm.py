# -*- coding: utf-8 -*-

"""
1D Transient Heat Conduction with Finite Difference Algorithm.

μ = λ /(ρ cp)
μ = 1.0\,mm^2\,s^-1 is assumed.
"""

# import numpy as np
import matplotlib as mp
from matplotlib import pyplot as plt
from matplotlib.animation import FuncAnimation

from typing import List, NewType
from loguru import logger

TemperatureField1D = NewType("TemperatureField1D", List[float])


# #############################################################################
# Initial conditions
# For x between 40 and 60: T = 1.0
# #############################################################################


def make_temperature_field(nodes) -> List[float]:
    """
    Make an initial temperature field.

    :param nodes: The number of grid nodes.
    """
    field = [0.0 for x in range(0, nodes)]

    for i in field:
        if i >= 40 and i <= 60:
            field[i] = 1.0

    return field


# #############################################################################
# Boundary conditions
# For x = 0 and x = L: T = 0.0
# #############################################################################


class Simulation:
    """
    The simulation of heat conduction on 1D domain with finite difference method. 

    Arguments:
        time_step: The temporal step in seconds (e.g 0.1).
        space_step: The spatial step in milimeters (e.g 1.0).
        steps: The number of simulation steps (e.g 1000).
        field: The initial state of temperature field,
    """

    def __init__(self, time_step, space_step, steps, field):
        self.dt = time_step
        self.dx = space_step
        self.steps = steps
        self.nodes = len(field)
        self.fields = [field]

    def __getitem__(self, index) -> TemperatureField1D:
        """
        Get the simulation field by index.
        """
        return self.fields[index]

    def start(self) -> None:
        """
        Start the simulation.
        """
        for i in range(self.steps):
            logger.info(f"step {i}")
            self.fields.append(self.evolve(self[-1]))

    def evolve(self, field: TemperatureField1D) -> TemperatureField1D:
        """
        Calculate a new field from the given one.
    
        :param field: A previous field. 
        :return: A next field.
        """
        # Create a defensive copy because we will update the given previous field in-place.
        field = list(field)

        # Neprocházíme okrajové body, ty zůstávají na T=0.
        # Jak procházet okrajové body v jiných příkladech?
        for i in range(1, self.nodes - 1):
            field[i] = field[i] + self.dt * (
                field[i + 1] - 2 * field[i] + field[i - 1]
            ) / (self.dx * self.dx)

        return field


# #############################################################################
# Configure and start the simulation.
# #############################################################################

NODES = 100
STEPS = 1000

simulation = Simulation(
    time_step=0.1, space_step=1.0, steps=STEPS, field=make_temperature_field(NODES),
)

# temperature_field_1d_fields
simulation.start()
result = simulation.fields

# #############################################################################
# Visualize the simulation result.
# #############################################################################

figure = plt.figure()
axis = figure.add_subplot(1, 1, 1)

xs = [x for x in range(NODES)]
# (line,) = axis.plot([], [])

plt.plot(xs, result[99])

# annotation = axis.annotate("US (0)", xy=(1, 0), xytext=(1, 0))


def animate(frame, number=1):
    # axis.set_xlim(0, 128)
    # axis.set_ylim(-0.5, 1.2)
    # axis.collections.clear()
    # axis.fill_between(xs, 0, frame, facecolor="yellow", alpha=0.5)
    line.set_data(xs, frame)
    line.set_color("black")
    return (line, axis)


# animation = FuncAnimation(
#     figure,
#     func=animate,
#     # fargs=([],),
#     frames=result,
#     interval=0.1,
#     repeat_delay=1,
#     blit=True,
# )

plt.show()
