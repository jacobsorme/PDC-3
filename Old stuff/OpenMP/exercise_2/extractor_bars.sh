


for i in 5000 30000
do
	echo "sum_results_${i} = ["
	for j in 1 2 4 8 16 32
	do
		echo -en "\t"
		grep -Poi "Max\(serial\).*duration = \K[0-9]+.[0-9]+" results/sum_results_thread${j}_size${i}.txt | tr -d '\n'
		echo -en ",\t"
		grep -Poi "Test\(omp_critical\).*duration = \K[0-9]+.[0-9]+" results/sum_results_thread${j}_size${i}.txt | tr -d '\n'
		echo -en ",\t"
		grep -Poi "Test\(omp_atomic\).*duration = \K[0-9]+.[0-9]+" results/sum_results_thread${j}_size${i}.txt | tr -d '\n'
		echo -en ",\t"
		grep -Poi "Test\(omp_local\).*duration = \K[0-9]+.[0-9]+" results/sum_results_thread${j}_size${i}.txt | tr -d '\n'
		echo -en ",\t"
		grep -Poi "Test\(omp_padded\).*duration = \K[0-9]+.[0-9]+" results/sum_results_thread${j}_size${i}.txt | tr -d '\n'
		echo -en ",\t"
		grep -Poi "Test\(omp_private\).*duration = \K[0-9]+.[0-9]+" results/sum_results_thread${j}_size${i}.txt | tr -d '\n'
		echo -en ",\t"
		grep -Poi "Test\(omp_reduction\).*duration = \K[0-9]+.[0-9]+" results/sum_results_thread${j}_size${i}.txt | tr -d '\n' 
		echo ";"
	done
	echo "];"
done

#Test(omp) = 2515.328870 duration = 0.023605 ± 0.000972 ms
#Test(omp_critical) = 4971.322194 duration = 0.713258 ± 0.006224 ms
#Test(omp_atomic) = 4971.322194 duration = 0.397468 ± 0.001648 ms
#Test(omp_local) = 4971.322194 duration = 0.024711 ± 0.000909 ms
#Test(omp_padded) = 4971.322194 duration = 0.021291 ± 0.000236 ms
#Test(omp_private) = 4971.322194 duration = 0.018056 ± 0.000644 ms
#Test(omp_reduction) = 4971.322194 duration = 0.017915 ± 0.001009 ms

