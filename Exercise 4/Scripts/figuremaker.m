clf;
clc;

run("matlab_variables.m");
x = [1:32];
y = [50:50:1500];

f = figure;

surf(x,y,times_nbody);
view(25,10);

xlabel("Threads")
ylabel("Number of bodies (N)")
zlabel("Time (s)")

saveas(f,"../Figures/surf_ex4_3","svg");


