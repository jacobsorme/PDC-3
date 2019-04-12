#!/bin/bash

#SBATCH -J Exercise2
#SBATCH -t 00:30:00
#SBATCH -A edu19.DD2356
#SBATCH --nodes=1
#SBATCH -e error_file.e

mkdir -p results

for i in 5000 10000 15000 20000 25000 30000
do
	for j in 1 2 4 8 16 32
	do
		export OMP_NUM_THREADS=${j}
		aprun -d $j ./bin/sum.out -n ${i} -r 50 > results/sum_results_thread${j}_size${i}.txt 	
	done
done
