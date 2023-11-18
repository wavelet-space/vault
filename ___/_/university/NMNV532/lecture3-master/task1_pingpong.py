from mpi4py import MPI
import numpy as np

comm = MPI.COMM_WORLD
rank = comm.rank

def print0(*args, **kwargs):
        if rank==0: print(*args, **kwargs)
        
if comm.size != 2:
    print("Use mpirun -np 2 python pingpong.py")
    exit(1)


def pingpong_0(data,loops,skip=0) :
    
    for x in range(loops):
        if x==skip: t=MPI.Wtime()
        if rank == 0:
            comm.send(data, dest = 1)
            data=comm.recv(source=1)
        else:
            data=comm.recv(source=0)
            comm.send(data, dest = 0)
            
    t=(MPI.Wtime()-t)/float(loops)
    size=2*data.nbytes/1024.0/1024.0
    return({'size':size, 'time':t})


def pingpong_1(data,loops,skip=0) :

    s_data=[data, MPI.DOUBLE]
    r_data=[data, MPI.DOUBLE]
    for x in range(loops):
        if x==skip: t=MPI.Wtime()
        if rank == 0:
            comm.Send(s_data, dest = 1)
            comm.Recv(r_data, source=1)
        else:
            comm.Recv(r_data, source=0)
            comm.Send(s_data, dest = 0)

    t=(MPI.Wtime()-t)/float(loops)
    size=2*data.nbytes/1024.0/1024.0
    return({'size':size, 'time':t})


if __name__ == '__main__':

    sizes=[0] + [ 2**i for i in range(22)]
    results=dict()
    
    for task in [pingpong_0, pingpong_1] :
        results[task.__name__]=[]
        
        for n in sizes :
            if rank == 0:
                data=np.random.randn(n)
            elif rank ==1:
                data=np.zeros(n)

            r=task(data,20,10)
            timings = np.array( comm.allgather(r['time']) )
            avg_t=np.mean(timings)
            speed= r['size'] / avg_t

            results[task.__name__].append( (r['size'], avg_t, speed) )
            print0(f"{task.__name__} : Size: {r['size']:8.2e} MB   comm time: {avg_t:8.2e} s    comm speed {speed:8.2e} MB/s")


if rank==0:
    import matplotlib
    matplotlib.use('Agg')
    import matplotlib.pyplot as plt

    r0=np.array(results['pingpong_0'])
    r1=np.array(results['pingpong_1'])

    plt.loglog(r0[:,0], r0[:,2], 'o-', label='python object')
    plt.loglog(r1[:,0], r1[:,2], 'x-', label='array data')
    plt.title('title')
    plt.xlabel('problem size in MB')
    plt.ylabel('MB/s')
    plt.legend(loc=4)
    plt.savefig("fig_comm_local.pdf", bbox_inches='tight')


