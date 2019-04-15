echo "times_nbody = ["

for i in {1..30}
do
	n=$(($i*50))
	for j in {1..32}
	do
		grep -Poi "Total runtime: \K[0-9]+.[0-9]+" ../Results/thread${j}_size${n}.txt | tr -d "\n"  
		echo -ne ",\t"
	done
	echo ";"
done

echo "];"
