#!/bin/bash

#SBATCH -J stream_benchmark
#SBATCH -t 0:30:00
#SBATCH -A edu19.DD2356
#SBATCH --nodes=1
#SBATCH -e error_file.e

mkdir -p Results_2

# Run the stream with 32 threads and different scheduling strategies and save in Results_2 directory

export OMP_NUM_THREADS=32

for j in {1..5}
do
        aprun -n 1 -d $OMP_NUM_THREADS ./stream_guided.out > Results_2/stream_benchmark_guided_${j}.txt
        aprun -n 1 -d $OMP_NUM_THREADS ./stream_static.out > Results_2/stream_benchmark_static_${j}.txt
        aprun -n 1 -d $OMP_NUM_THREADS ./stream_dynamic.out > Results_2/stream_benchmark_dynamic_${j}.txt
done