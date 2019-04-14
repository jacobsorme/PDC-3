#!/bin/bash

#SBATCH -J Parallel_sum
#SBATCH -t 00:30:00
#SBATCH -A edu19.DD2356
#SBATCH --nodes=1
#SBATCH -e error_file.e

mkdir -p Results

# Benchmark the sum functions for different sizes and numbers of threads and save in directory Results

for i in 5000 30000
do
	for j in 1 2 4 8 16 32
	do
		export OMP_NUM_THREADS=${j}
		aprun -n 1 -d $OMP_NUM_THREADS ./bin/sum.out -d -n ${i} -r 50 > Results/sum_results_threads_${j}_size_${i}.txt 	
	done
done
