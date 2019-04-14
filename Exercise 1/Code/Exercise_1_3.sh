#!/bin/bash

#SBATCH -J stream_benchmark
#SBATCH -t 0:30:00
#SBATCH -A edu19.DD2356
#SBATCH --nodes=1
#SBATCH -e error_file.e

mkdir -p Results_2

# Run the stream with 32 threads and different scheduling strategies and save in Results_2 directory

export OMP_NUM_THREADS=32

#for j in {1..5}
#do
        aprun -n 1 -d $OMP_NUM_THREADS ./stream_guided.out > Results_2/stream_benchmark_guided_${j}.txt
        aprun -n 1 -d $OMP_NUM_THREADS ./stream_static.out > Results_2/stream_benchmark_static_${j}.txt
        aprun -n 1 -d $OMP_NUM_THREADS ./stream_dynamic.out > Results_2/stream_benchmark_dynamic_${j}.txt
#done

# Create a Matlab matrix from the benchmarks and save it to the Results_2 directory

echo -n "stream_bandwidths_guided = [" > Results_2/matlab_matrix.m
for j in {1..5}
do 
        echo -ne "\t" >> Results_2/matlab_matrix.m
        grep -Poi "Copy:\W+\K[0-9]+\.[0-9]+" ./Results_2/stream_benchmark_guided_${j}.txt | tr -d '\n' >> Results_2/matlab_matrix.m
done
echo "];" >> Results_2/matlab_matrix.m

echo -n "stream_bandwidths_static = [" >> Results_2/matlab_matrix.m
for j in {1..5}
do
        echo -ne "\t" >> Results_2/matlab_matrix.m
        grep -Poi "Copy:\W+\K[0-9]+\.[0-9]+" ./Results_2/stream_benchmark_static_${j}.txt | tr -d '\n' >> Results_2/matlab_matrix.m
done
echo "];" >> Results_2/matlab_matrix.m

echo -n "stream_bandwidths_dynamic = [" >> Results_2/matlab_matrix.m
for j in {1..5}
do
        echo -ne "\t" >> Results_2/matlab_matrix.m
        grep -Poi "Copy:\W+\K[0-9]+\.[0-9]+" ./Results_2/stream_benchmark_dynamic_${j}.txt | tr -d '\n' >> Results_2/matlab_matrix.m
done
echo "];" >> Results_2/matlab_matrix.m

# Remove tabs for nicer formatting
sed -i -e 's/\[\t/\[/g' Results_2/matlab_matrix.m

# Run perf benchmarks on different scheduling
aprun -n 1 -d $OMP_NUM_THREADS perf stat -e L1-dcache-load-misses,L1-dcache-loads,instructions,cycles ./stream_guided.out > Results_2/perf_guided.txt
aprun -n 1 -d $OMP_NUM_THREADS perf stat -e L1-dcache-load-misses,L1-dcache-loads,instructions,cycles ./stream_static.out > Results_2/perf_static.txt
aprun -n 1 -d $OMP_NUM_THREADS perf stat -e L1-dcache-load-misses,L1-dcache-loads,instructions,cycles ./stream_dynamic.out > Results_2/perf_dynamic.txt

