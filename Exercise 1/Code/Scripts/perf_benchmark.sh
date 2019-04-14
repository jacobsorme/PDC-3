#!/bin/bash

#SBATCH -J stream_benchmark
#SBATCH -t 0:30:00
#SBATCH -A edu19.DD2356
#SBATCH --nodes=1
#SBATCH -e error_file.e

mkdir -p Results_2

# Run perf benchmarks on different scheduling
aprun -n 1 -d $OMP_NUM_THREADS perf stat -e L1-dcache-load-misses,L1-dcache-loads,instructions,cycles ./stream_guided.out 2>Results_2/perf_guided.txt
aprun -n 1 -d $OMP_NUM_THREADS perf stat -e L1-dcache-load-misses,L1-dcache-loads,instructions,cycles ./stream_static.out 2>Results_2/perf_static.txt
aprun -n 1 -d $OMP_NUM_THREADS perf stat -e L1-dcache-load-misses,L1-dcache-loads,instructions,cycles ./stream_dynamic.out 2>Results_2/perf_dynamic.txt
