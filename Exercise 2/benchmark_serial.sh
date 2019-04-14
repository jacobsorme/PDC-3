#!/bin/bash

#SBATCH -J Exercise2
#SBATCH -t 00:30:00
#SBATCH -A edu19.DD2356
#SBATCH --nodes=1
#SBATCH -e error_file.e

# Run the serial version 50 times and report execution time and standard deviation

mkdir -p Results_1

export OMP_NUM_THREADS=1
aprun -d $OMP_NUM_THREADS ./bin/sum.out -d -n 30000 -r 50 > Results_1/serial_benchmark.txt
