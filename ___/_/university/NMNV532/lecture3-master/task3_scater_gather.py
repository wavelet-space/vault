from mpi4py import MPI
import numpy as np


comm = MPI.COMM_WORLD
rank = comm.rank
size = comm.size
name = MPI.Get_processor_name()

if rank == 0: 
    data = [(x+1) ** x for x in range (size)]
    print('scattering data',data)
else:
    data = None
    
data = comm.scatter(data,root=0)
print('rank',rank,'has data: ', data)
     
new_data = comm.gather(data, root=0)
print('rank',rank,'after gather: ', new_data)
