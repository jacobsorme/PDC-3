echo -n "" > Results/matlab_variables.m
for i in 5000 30000
do
echo "sum_results_$i = [" >> Results/matlab_variables.m
	for j in 1 2 4 8 16 32
	do
		echo -en "\t" >> Results/matlab_variables.m
		grep -Poi "Max\(serial\).*duration = \K[0-9]+.[0-9]+" Results/sum_results_threads_${j}_size_${i}.txt | tr -d '\n' >> Results/matlab_variables.m
		echo -en ",\t" >> Results/matlab_variables.m
		grep -Poi "Test\(omp_critical\).*duration = \K[0-9]+.[0-9]+" Results/sum_results_threads_${j}_size_${i}.txt | tr -d '\n' >> Results/matlab_variables.m
		echo -en ",\t" >> Results/matlab_variables.m
		grep -Poi "Test\(omp_atomic\).*duration = \K[0-9]+.[0-9]+" Results/sum_results_threads_${j}_size_${i}.txt | tr -d '\n' >> Results/matlab_variables.m
		echo -en ",\t" >> Results/matlab_variables.m
		grep -Poi "Test\(omp_local\).*duration = \K[0-9]+.[0-9]+" Results/sum_results_threads_${j}_size_${i}.txt | tr -d '\n' >> Results/matlab_variables.m
		echo -en ",\t" >> Results/matlab_variables.m
		grep -Poi "Test\(omp_padded\).*duration = \K[0-9]+.[0-9]+" Results/sum_results_threads_${j}_size_${i}.txt | tr -d '\n' >> Results/matlab_variables.m
		echo -en ",\t" >> Results/matlab_variables.m
		grep -Poi "Test\(omp_private\).*duration = \K[0-9]+.[0-9]+" Results/sum_results_threads_${j}_size_${i}.txt | tr -d '\n' >> Results/matlab_variables.m
		echo -en ",\t" >> Results/matlab_variables.m
		grep -Poi "Test\(omp_reduction\).*duration = \K[0-9]+.[0-9]+" Results/sum_results_threads_${j}_size_${i}.txt | tr -d '\n'  >> Results/matlab_variables.m
		echo ";" >> Results/matlab_variables.m
	done
	echo "];" >> Results/matlab_variables.m
done

