

Numerical studies of Cahn-Hilliard equation and applications in image processing

@article{Furihata2001,
  doi = {10.1007/pl00005429},
  url = {https://doi.org/10.1007/pl00005429},
  year = {2001},
  month = feb,
  publisher = {Springer Science and Business Media {LLC}},
  volume = {87},
  number = {4},
  pages = {675--699},
  author = {Daisuke Furihata},
  title = {A stable and conservative finite difference scheme for the Cahn-Hilliard equation},
  journal = {Numerische Mathematik}
}

+ 2001 FURIHATA. A stable and conservative finite difference scheme for the Cahn-Hilliard equation


## Architecture

The central classes of the package is `Simulation` class which takes model object and runs the simulation according to the configuration.
The `Simulation` is an abstract class from which a classes representing a concrete simulation must derive. The simulation object contains
special method which runs the model time step. How many steps we run, is the responsibility of this object. The `Simulation` also
takes the responsibility of sending the results of the simulation to other systems. This add flexibility to consume the results continuously e.g., we can save a plot for each `n` steps to observe a results when simulation is still running. We can also pause and resume the simulation.

Every model is represented by a standalone class that is responsible for setting up and solving the coresponding
model.


## Notes

- https://towardsdatascience.com/stop-using-numpy-random-seed-581a9972805f


- [ ] Be able to observe, pause and resume the running simulation.
- - [ ] Run multiple simulations in simultaneously / in paralell.
  - Use multiprocessing or threading?
- [ ] Be able to see progress (image) when te simulation is running: producer/consumer pattern?
  Use some message queue such as (Celery | Dramatique) + Redis?
