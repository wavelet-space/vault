
import numpy as np
import matplotlib.pyplot as plt


"""
Stochastic processes

* 1D random walk
* 2D random walk

To be able to reproduce the process always set the seed before program run e.g
    np.random.seed(123)
"""

# TODO Upravit osy, začínat v nule a vyklersil osu x na nule
# TODO Upravit osu y aby byla symetrická
# TODO není nutné počítat jen p1 a pak dopočítat p2 = 1 - p1 ?
# TODO Spočítat počet návratů
# TODO střední hodnot avzdálenosti od počátku

# Gausovský bílý šum.


class RandomWalk1D:

    def __init__(self, steps, probs=(0.5, 0.5)):
        self.steps = steps
        self.probs = probs

    def points(self) -> int:
        x = 0
        yield 0, x
        for n in range(1, self.steps):
            x += np.random.choice([-1, 1], p=(self.probs[0], self.probs[1]))
            yield n, x

    @classmethod
    def plot(self, ns, xs, color="k"):
        # plt.figure()
        # plt.xlim(xmin=0)
        fig = plt.figure()

        axs = fig.add_subplot(1, 1, 1)
        axs.get_xaxis().tick_bottom()
        axs.get_yaxis().tick_left()
        axs.set(xlim=(0, len(ns)))
        axs.set_xlabel("Step")
        axs.set_ylabel("Position")
        axs.spines['left'].set_position('zero')
        axs.spines['bottom'].set_position('zero')
        plt.plot(ns, xs, color)
        plt.show()



class RandomWalk2D: # TODO

    def __init__(self, steps, probs=(0.5, 0.5, 0.5, 0.5)):
        self.steps = steps
        self.probs = probs

    def points(self) -> int:
        x = 0
        y = 0
        yield x, y

        for _ in range(1, self.steps):
            x += np.random.choice([-1, 1], p=(self.probs[0], self.probs[1]))
            y += np.random.choice([-1, 1], p=(self.probs[2], self.probs[3]))
            # print(x, y)
            yield x, y
