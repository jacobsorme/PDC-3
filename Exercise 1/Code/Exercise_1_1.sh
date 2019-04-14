#!/bin/bash

#SBATCH -J stream_benchmark
#SBATCH -t 0:30:00
#SBATCH -A edu19.DD2356
#SBATCH --nodes=1
#SBATCH -e error_file.e

mkdir -p Results_1

# Run the stream benchmark for 1, 2, 4, 8, 16 and 32 threads and save the results in Results_1 directory
for i in {1..32}
do
	# Run each benchmark five times
	for j in {1..5}
	do
		export OMP_NUM_THREADS=$i
		aprun -n 1 -d $OMP_NUM_THREADS ./stream.out > Results_1/stream_benchmark_${i}_threads_${j}.txt
	done
done

# Create a Matlab matrix from the stream benchmarks and save it in the Results_1 directory

echo "stream_bandwidths = [" > Results_1/matlab_matrix.m
echo -e "\t% First element of row = number of threads, then comes the benchmark results" >> Results_1/matlab_matrix.m

for i in {1..32}
do
	echo -ne "\t$i" >> Results_1/matlab_matrix.m
	for j in {1..5}
	do 
		echo -ne ",\t" >> Results_1/matlab_matrix.m
        	grep -Poi "Copy:\W+\K[0-9]+\.[0-9]+" ./Results_1/stream_benchmark_${i}_threads_${j}.txt | tr -d '\n' >> Results_1/matlab_matrix.m
	done
	echo ";" >> Results_1/matlab_matrix.m
done
echo "];" >> Results_1/matlab_matrix.m
