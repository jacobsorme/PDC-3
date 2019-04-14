clf;

run("Results/matlab_variables.m");

threads = dft_times(:,1);
times = dft_times(:,2);

plot(threads, times,'*');
hold on;

numthreads = length(threads)

X = [1./threads ones(numthreads, 1)];

% X * beta = times

beta = (X'*X)\(X'*times);
xv = 1:0.01:32;
yv = beta(1)./xv + beta(2);
plot(xv,yv);
leg2 = sprintf("$Interpolation: \\hat{y} = \\frac{%.2f}{x} + %.2f$", beta(1), beta(2));
legend(["Measured values", leg2], 'Interpreter', 'latex');
xlabel("Threads");
ylabel("DFT execution time (s)");
