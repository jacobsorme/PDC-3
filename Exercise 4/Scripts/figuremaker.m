clf;
clc;

run("matlab_variables.m");
x = [1:32];
y = [50:50:500];

f = figure;

surf(x,y,times_nbody(1:10,:));
view(45,10);

xlabel("Threads")
ylabel("Number of bodies (N)")
zlabel("Time (s)")

saveas(f,"../Figures/surf_ex4_4","svg");


