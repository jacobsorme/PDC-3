echo "high_defs = ["

for i in {1..32}
do
	size=$(($i*2500))
	for j in {1..32}
	do
		echo -ne "\t"
		grep -Poi "Test\(omp_reduction\).*duration = \K[0-9]+.[0-9]+" results/sum_results_thread${j}_size${size}.txt | tr -d '\n' 
		echo -en ", "
	done
	echo ";"
done

echo "];"

#Test(omp) = 2515.328870 duration = 0.023605 ± 0.000972 ms
#Test(omp_critical) = 4971.322194 duration = 0.713258 ± 0.006224 ms
#Test(omp_atomic) = 4971.322194 duration = 0.397468 ± 0.001648 ms
#Test(omp_local) = 4971.322194 duration = 0.024711 ± 0.000909 ms
#Test(omp_padded) = 4971.322194 duration = 0.021291 ± 0.000236 ms
#Test(omp_private) = 4971.322194 duration = 0.018056 ± 0.000644 ms
#Test(omp_reduction) = 4971.322194 duration = 0.017915 ± 0.001009 ms

