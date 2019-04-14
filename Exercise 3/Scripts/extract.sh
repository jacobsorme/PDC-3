echo "dft_times = [" > Results/matlab_variables.m
for i in {1..32}
do
	echo -ne "\t$i,\t" >> Results/matlab_variables.m
	grep -Poi "=\W+\K[0-9]+.[0-9]+" Results/dft_results_${i}.txt | tr -d '\n' >> Results/matlab_variables.m
	echo -ne ",\t" >> Results/matlab_variables.m
	grep -Poi "±\K[0-9]+.[0-9]+" Results/dft_results_${i}.txt | tr -d '\n' >> Results/matlab_variables.m
	echo ";" >> Results/matlab_variables.m
done
echo "];" >> Results/matlab_variables.m
