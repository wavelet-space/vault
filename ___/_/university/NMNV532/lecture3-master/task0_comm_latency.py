from mpi4py import MPI
import numpy as np
from time import time

comm = MPI.COMM_WORLD
rank = comm.rank

if comm.size != 2:
    print("Use mpirun -np 2 python pingpong.py")
    exit(1)

    
comm.Barrier()
# warm up communication
if rank == 0:
    t0_start=np.array(time())
    comm.Send([t0_start, MPI.DOUBLE], dest = 1, tag=10)

elif rank == 1:
    t1_start=np.zeros(1)
    comm.Recv([t1_start, MPI.DOUBLE], source=0, tag=10)

# run 
comm.Barrier()

if rank == 0:
    t0_start=np.array([time()])
    comm.Ssend([t0_start, MPI.DOUBLE], dest = 1, tag=11)
    t0_end=np.array([time()])
    comm.Send([t0_end, MPI.DOUBLE], dest = 1, tag=12)

elif rank == 1:
    t0_start=np.zeros(1)
    t1_start=np.array([time()])
    comm.Recv([t0_start, MPI.DOUBLE], source=0, tag=11)
    t1_end=np.array([time()])
    t0_end=np.zeros(1)
    comm.Recv([t0_end, MPI.DOUBLE],source=0, tag=12)
    
comm.Barrier()

if rank==1 :
    dt_send = t0_end - t0_start
    dt_recv = t1_end - t1_start
    dt_start = t1_start - t0_start
    dt_end = t1_end - t0_end
    print( f" send={dt_send}, recv={dt_recv}, start={dt_start}, end={dt_end}" )
