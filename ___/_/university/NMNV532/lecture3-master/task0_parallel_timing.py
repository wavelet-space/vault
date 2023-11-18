#!/usr/bin/env python
from mpi4py import MPI
import datetime
import time, sys
import numpy as np

comm = MPI.COMM_WORLD
rank = comm.Get_rank()

def print0(*args, **kwargs):
    if rank==0: print(*args, **kwargs)

        
print0('Is mpi.wtime global? {0}'.format(comm.Get_attr(MPI.WTIME_IS_GLOBAL)))
print0('MPI Wtime tick is {0}'.format(MPI.Wtick()))


# measure time by python time() function (gives unix time in seconds)
sys.stdout.flush()
comm.Barrier()
now = time.time()
nows = comm.allgather(now)

print0('the now is {0}'.format(nows))
print0('accuracy of time(): +- {0:8.2e}'.format(np.std(nows)))


# measure time by python datetime.now() function (gives unix time in seconds)
sys.stdout.flush()
comm.Barrier()
now = datetime.datetime.now().timestamp()
nows = comm.allgather(now)

print0('the now is {0}'.format(nows))
print0('accuracy of datetime: +- {0:8.2e}'.format(np.std(nows)))


#measure time by MPI Wtime() function (gives unix time in seconds)
sys.stdout.flush()
comm.Barrier()
now = MPI.Wtime()
nows = comm.allgather(now)

print0('the now is {0}'.format(nows))
print0('accuracy of mpi wtime: +- {0:8.2e}'.format(np.std(nows)))


