clf;
clc;

run("matlab_variables.m");
x = [1:32];
y = [50:50:1500];

f = figure;

surf(x,y,times_nbody);
view(15,10);

xlabel("X")
ylabel("Y")
zlabel("Time (asdad)")

saveas(f,"../Figures/surf_ex4","svg");


