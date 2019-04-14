echo -n "serial_time = "
# > Results_1/matlab_variables.m
grep -Poi "Max\(serial\).*duration = \K[0-9]+.[0-9]+" Results_1/serial_benchmark.txt | tr -d '\n'
echo ";"

echo -n "serial_std = "
# > Results_1/matlab_variables.m
grep -Poi "Max\(serial\).*± \K[0-9]+.[0-9]+" Results_1/serial_benchmark.txt | tr -d '\n'
echo ";"
