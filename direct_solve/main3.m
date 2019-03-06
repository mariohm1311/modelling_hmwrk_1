addpath('iterative', 'direct_solve', 'gradient_descent');
A = [7, 3, -1;
    3, 7, 1;
    -2, 3, 7];
b = [26, 24, 6];
parameters.tol = 1e-8;
parameters.maxiter = 10000000;
parameters.print = 0;
x5 = zeros(length(b), 1);
parameters.omega = optimize_omega(10, A, b, parameters);
% [x5, iter(5)] = iterate('sor', A, b,x5, parameters)
disp(parameters.omega)