
echo "dft_times = ["
for i in 1 2 4 8 16 32
do
	echo -ne "\t$i,\t"
	grep -Poi "=\W+\K[0-9]+.[0-9]+" results/dft_results_${i}.txt | tr -d '\n'
	echo -ne ",\t"  
	grep -Poi "±\K[0-9]+.[0-9]+" results/dft_results_${i}.txt | tr -d '\n'
	echo ";"
done
echo "];"
