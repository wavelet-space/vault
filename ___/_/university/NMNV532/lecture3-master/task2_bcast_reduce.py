from mpi4py import MPI
import numpy as np


comm = MPI.COMM_WORLD
rank = comm.rank
size = comm.size
name = MPI.Get_processor_name()

if rank == 0: 
    data = 8
    print('bcasting data',data)
else:
    data = None
    
data = comm.bcast(data,root=0)
print('rank',rank,'has data: ', data)

sum = comm.reduce(data, op=MPI.SUM, root=0)
print('rank',rank,'has sum: ', sum)
