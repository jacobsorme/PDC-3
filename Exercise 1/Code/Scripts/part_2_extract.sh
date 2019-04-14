# Create a Matlab matrix of the benchmarks from part_2_benchmark and save it to the Results_2 directory

echo -n "stream_bandwidths_guided = [" > Results_2/matlab_matrix.m
for j in {1..5}
do 
        echo -ne "\t" >> Results_2/matlab_matrix.m
        grep -Poi "Copy:\W+\K[0-9]+\.[0-9]+" ./Results_2/stream_benchmark_guided_${j}.txt | tr -d '\n' >> Results_2/matlab_matrix.m
done
echo "];" >> Results_2/matlab_matrix.m

echo -n "stream_bandwidths_static = [" >> Results_2/matlab_matrix.m
for j in {1..5}
do
        echo -ne "\t" >> Results_2/matlab_matrix.m
        grep -Poi "Copy:\W+\K[0-9]+\.[0-9]+" ./Results_2/stream_benchmark_static_${j}.txt | tr -d '\n' >> Results_2/matlab_matrix.m
done
echo "];" >> Results_2/matlab_matrix.m

echo -n "stream_bandwidths_dynamic = [" >> Results_2/matlab_matrix.m
for j in {1..5}
do
        echo -ne "\t" >> Results_2/matlab_matrix.m
        grep -Poi "Copy:\W+\K[0-9]+\.[0-9]+" ./Results_2/stream_benchmark_dynamic_${j}.txt | tr -d '\n' >> Results_2/matlab_matrix.m
done
echo "];" >> Results_2/matlab_matrix.m

# Remove tabs for nicer formatting
sed -i -e 's/\[\t/\[/g' Results_2/matlab_matrix.m
