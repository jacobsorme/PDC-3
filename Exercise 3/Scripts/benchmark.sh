#!/bin/bash

#SBATCH -J DFT
#SBATCH -t 1:00:00
#SBATCH -A edu19.DD2356
#SBATCH --nodes=1
#SBATCH -e error_file.e

mkdir -p Results

for i in {1..32}
do
    export OMP_NUM_THREADS=$i
    aprun -d $OMP_NUM_THREADS ../bin/dft.out -i ../dat/input1.dat -v ../dat/input1_forward.dat -r 10 > Results/dft_results_${i}.txt 
done
