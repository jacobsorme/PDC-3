# Create a Matlab matrix of the benchmark results from part_1_benchmark and save it in the Results_1 directory

echo "stream_bandwidths = [" > Results_1/matlab_matrix.m
echo -e "\t% First element of row = number of threads, then comes the benchmark results" >> Results_1/matlab_matrix.m

for i in {1..32}
do
	echo -ne "\t$i" >> Results_1/matlab_matrix.m
	for j in {1..5}
	do 
		echo -ne ",\t" >> Results_1/matlab_matrix.m
        	grep -Poi "Copy:\W+\K[0-9]+\.[0-9]+" ./Results_1/stream_benchmark_${i}_threads_${j}.txt | tr -d '\n' >> Results_1/matlab_matrix.m
	done
	echo ";" >> Results_1/matlab_matrix.m
done
echo "];" >> Results_1/matlab_matrix.m
