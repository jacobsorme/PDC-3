clf;
% Threads, time and stdev for 10 repetitions
% dft_times = [
% 	1,	11.357410,	0.012863;
% 	2,	5.801143,	0.011374;
% 	4,	3.176952,	0.011562;
% 	8,	1.805324,	0.002741;
% 	16,	0.937652,	0.000223;
% 	32,	0.471189,	0.000311;
% ];

dft_times = [
        1,      10.187428,      ;
        2,      5.231638,       ;
        3,      3.767636,       ;
        4,      2.903722,       ;
        5,      2.391003,       ;
        6,      2.057695,       ;
        7,      1.827137,       ;
        8,      1.655405,       ;
        9,      1.480260,       ;
        10,     1.329083,       ;
        11,     1.208535,       ;
        12,     1.108324,       ;
        13,     1.025335,       ;
        14,     0.952175,       ;
        15,     0.889104,       ;
        16,     0.834259,       ;
        17,     0.784167,       ;
        18,     0.740999,       ;
        19,     0.700743,       ;
        20,     0.663752,       ;
        21,     0.631842,       ;
        22,     0.602633,       ;
        23,     0.574809,       ;
        24,     0.549422,       ;
        25,     0.528321,       ;
        26,     0.514079,       ;
        27,     0.495948,       ;
        28,     0.477926,       ;
        29,     0.461896,       ;
        30,     0.447164,       ;
        31,     0.433595,       ;
        32,     0.420851,       ;
];


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
legend(["Measured values", leg2], 'Interpreter', 'latex', 'FontSize', 16);
xlabel("Threads");
ylabel("DFT execution time (s)");