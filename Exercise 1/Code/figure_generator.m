%% Place your cursor / marker in the section you want to run and press CTRL+ÉNTER
%  If CTRL+ENTER does not work, press "Run Section" in the GUI
%% Part 1
clf;
clc;

% Import the matrix
run("Results_1/matlab_matrix.m");

m = size(stream_bandwidths,1);
n = size(stream_bandwidths,2);

threads = stream_bandwidths(:,1);

mean_bandwidths = zeros(m,1);
std_bandwidths = zeros(m,1);

for i = 1:m
    mean_bandwidths(i) = mean(stream_bandwidths(i,2:n));
    std_bandwidths(i) = std(stream_bandwidths(i,2:n));
end

hold on;
plot(threads, mean_bandwidths, 'b*--');

for i = 1:m
   plot([threads(i), threads(i)], [mean_bandwidths(i) - std_bandwidths(i), mean_bandwidths(i) + std_bandwidths(i)], 'r--');
end

xlabel("Threads");
ylabel("Bandwidth (MB/s)");

%% Part 2
clf;
clc;
run("Results_2/matlab_matrix.m");
bar([mean(stream_bandwidths_guided(:,2)), mean(stream_bandwidths_static(:,2)), mean(stream_bandwidths_dynamic(:,2))]);
set(gca, 'xticklabel', {'Guided', 'Static', 'Dynamic'});
xlabel("Scheduling");
ylabel("Bandwidth (MB/s)");