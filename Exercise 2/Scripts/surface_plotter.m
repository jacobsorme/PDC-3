% Plots a high def surface plot for reduction sum

run("Results/reduction_surface.m");

x = [1:32];
y = [2500:2500:80000];
f = figure;



surf(x,y,high_defs);
xlabel("Number of threads")
ylabel("Size")
zlabel("Time (s)");

yticklabels({'0','20000','40000','60000','80000'})

view(15,10);
saveas(f,'test','svg')

