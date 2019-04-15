#!/bin/bash

#SBATCH -J Nbody
#SBATCH -t 00:45:00
#SBATCH -A edu19.DD2356
#SBATCH --nodes=1
#SBATCH -e error_file.e

mkdir -p ../Results

for i in {13..30}
do
	n=$(($i*50))
	for j in {1..32}
	do
    		export OMP_NUM_THREADS=${j}
    		aprun -d $OMP_NUM_THREADS ../bin/nbody.out -n $n -t 10 > ../Results/thread${j}_size${n}.txt 
	done
done
