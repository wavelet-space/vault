###
# srun -p express3 -u -n 36 -N 1 --cpu-bind=rank python-mpi task4_pingpong_array.py
###

from mpi4py import MPI
import numpy as np
from time import time

comm = MPI.COMM_WORLD
rank = comm.rank

def pingpong(sender,receiver,data,buff) :

    size=0.0
    dt=0.0
    
    #print(f"[{rank:3}]   {sender:3} -> {receiver:3}............")
    #comm.Barrier()
    if sender!=receiver :
 
        if rank==sender:
            t=time()
            comm.Ssend([data, MPI.DOUBLE], dest=receiver)
            ##comm.Recv([buff, MPI.DOUBLE], source=receiver)
            dt=(time()-t)
            size=data.nbytes
        elif rank==receiver:
            t=time()
            comm.Recv([buff, MPI.DOUBLE], source=sender)
            ##comm.Ssend([data, MPI.DOUBLE], dest=sender)
            dt=(time()-t)
            size=data.nbytes
        
    else :

        if rank==sender:
            t=time()
            comm.Sendrecv([data, MPI.DOUBLE], dest=receiver, recvbuf=[buff, MPI.DOUBLE], source=sender)
            dt=(time()-t)
            size=data.nbytes

    #comm.Barrier()
    return({'size':size, 'time':dt})

if __name__ == '__main__':

    N=256
    ncpus=comm.size
    mat=np.zeros((ncpus,ncpus))

    n1set=np.random.permutation(ncpus)
    #n1set=range(ncpus)
    n1set=comm.bcast(n1set,root=0)
    for n1 in n1set :
        n2set=np.random.permutation(ncpus)
        #n2set=range(ncpus)
        n2set=comm.bcast(n2set,root=0)
        for n2 in n2set :

            data=np.random.random(N)
            buff=np.zeros_like(data)

            r0=pingpong(n1,n2,data,buff)

            times=[]
            sizes=[]
            
            for x in range(1000):
                data=np.random.random(N)
                r1=pingpong(n1,n2,data,buff)
                times.append( r1['time'] )
                sizes.append( r1['size'] )
                
            t = np.mean( times )
            s = np.mean( sizes ) /(1024.0**3)
            if t>0.0 :speed= s / t
            else : speed=0.0
            
            mat[n1,n2]=t*1e6
            
            if rank==n1 or rank==n2 :
                print(f"[{rank:3}]   {n1:3} -> {n2:3}: comm time: {t:8.2e} s    comm speed {speed:8.2e} GB/s")


gmat=np.zeros_like(mat) if rank==0 else None
comm.Reduce(mat, gmat, op=MPI.MAX, root=0)

if rank==0 :
    import matplotlib
    matplotlib.use('Agg')
    import matplotlib.pyplot as plt

    plt.imshow(gmat)
    plt.set_cmap('jet')
    cbar=plt.colorbar()
    plt.title('point-to-point communication time')
    plt.xlabel('sender rank')
    plt.ylabel('receiver rank')
    cbar.set_label(r'communication time in $\mu$s')

    plt.savefig(f"fig_ptp_comm_timings.png", bbox_inches='tight')
