# Generate a matrix to reduction_surface.m which can be plotted as a surface plot
echo "high_defs = [" > Results/reduction_surface.m

for i in {1..32}
do
	size=$(($i*2500))
	for j in {1..32}
	do
		echo -ne "\t" >> Results/reduction_surface.m
		grep -Poi "Test\(omp_reduction\).*duration = \K[0-9]+.[0-9]+" results/sum_results_thread${j}_size${size}.txt | tr -d '\n' >> Results/reduction_surface.m
		echo -en ", " >> Results/reduction_surface.m
	done
	echo ";" >> Results/reduction_surface.m
done

echo "];" >> Results/reduction_surface.m
