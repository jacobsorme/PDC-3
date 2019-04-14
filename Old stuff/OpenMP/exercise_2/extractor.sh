echo "sum_results = ["

for i in 5000 30000
do
	for j in 1 2 4 8 16 32
	do
		echo -en "\t"
		grep -Poi "Max\(serial\).*duration = \K[0-9]+.[0-9]+" Results_2/sum_results_threads_${j}_size_${i}.txt | tr -d '\n'
		echo -en ",\t"
		grep -Poi "Test\(omp_critical\).*duration = \K[0-9]+.[0-9]+" Results_2/sum_results_threads_${j}_size_${i}.txt | tr -d '\n'
		echo -en ",\t"
		grep -Poi "Test\(omp_atomic\).*duration = \K[0-9]+.[0-9]+" Results_2/sum_results_threads_${j}_size_${i}.txt | tr -d '\n'
		echo -en ",\t"
		grep -Poi "Test\(omp_local\).*duration = \K[0-9]+.[0-9]+" Results_2/sum_results_threads_${j}_size_${i}.txt | tr -d '\n'
		echo -en ",\t"
		grep -Poi "Test\(omp_padded\).*duration = \K[0-9]+.[0-9]+" Results_2/sum_results_threads_${j}_size_${i}.txt | tr -d '\n'
		echo -en ",\t"
		grep -Poi "Test\(omp_private\).*duration = \K[0-9]+.[0-9]+" Results_2/sum_results_threads_${j}_size_${i}.txt | tr -d '\n'
		echo -en ",\t"
		grep -Poi "Test\(omp_reduction\).*duration = \K[0-9]+.[0-9]+" Results_2/sum_results_threads_${j}_size_${i}.txt | tr -d '\n' 
		echo ";"
	done
	echo ";"
done
echo "];"
