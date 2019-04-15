clf;
clc;

run("matlab_variables.m");
x = [1:32];
y = [50:50:1000];

f = figure;

surf(x,y,times_nbody(1:20,:));
view(15,10);

xlabel("Threads")
ylabel("Nuber of bodies (N)")
zlabel("Time (s)")

saveas(f,"../Figures/surf_ex4","svg");


