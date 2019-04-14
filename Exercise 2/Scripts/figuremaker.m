%% Click on a section and press "Run Section" to get the figure

%% Size 5000
clf;
clc;

run("Results/matlab_variables.m");

bar_labels = categorical({'1', '2', '4', '8', '16', '32'});
bar_labels = reordercats(bar_labels,{'1', '2', '4', '8', '16', '32'});
barh(bar_labels,sum_results_5000);
xlabel("Time");
ylabel("Threads");

legend("serial", "critical", "atomic", "local (array)", "padded", "private (for)", "reduction");

%% Size 30000
clf;
clc;

run("Results/matlab_variables.m");

bar_labels = categorical({'1', '2', '4', '8', '16', '32'});
bar_labels = reordercats(bar_labels,{'1', '2', '4', '8', '16', '32'});
barh(bar_labels,sum_results_30000);
xlabel("Time");
ylabel("Threads");

legend("serial", "critical", "atomic", "local (array)", "padded", "private (for)", "reduction");


%% Size 5000 without atomic and critical
clf;
clc;

run("Results/matlab_variables.m");

bar_labels = categorical({'1', '2', '4', '8', '16', '32'});
bar_labels = reordercats(bar_labels,{'1', '2', '4', '8', '16', '32'});
barh(bar_labels,sum_results_5000(:,[1,4,5,6,7]));
xlabel("Time");
ylabel("Threads");

legend("serial", "local (array)", "padded", "private (for)", "reduction");

%% Size 30000 without atomic and critical
clf;
clc;

run("Results/matlab_variables.m");

bar_labels = categorical({'1', '2', '4', '8', '16', '32'});
bar_labels = reordercats(bar_labels,{'1', '2', '4', '8', '16', '32'});
barh(bar_labels,sum_results_30000(:,[1,4,5,6,7]));
xlabel("Time");
ylabel("Threads");

legend("serial", "local (array)", "padded", "private (for)", "reduction");
