clear
addpath('iterative', 'direct_solve', 'gradient_descent', 'tridiag');
problem = load('heatI.mat', 'A', 'b');
%problemII = load('heatII.mat', 'A', 'b');
A = problem.A; b = problem.b;
%AII = problemII.A; bII = problemII.b;
n = length(b);
parameters.tol = 1e-7;
parameters.maxiter = 10000000;
parameters.print = 1;

%1
%spy(AI);
bandI = bandwidth(A);

% A = diag(1./diag(A))*A;
% b = diag(1./diag(A))*b;

%2
% tic
% LU= LUfactor(A);
% x1 = LUsolve(LU, b);
% toc
% 
% tic
% LU= trid_LUfactor(A);
% x1 = trid_LUsolve(LU, b);
% toc

% tic
% x2 = A\b;
% toc

%3
tic
x3 = zeros(n, 1);
iter = zeros(5, 1);
[x3, iter(3)] = iterate('jacobi', A, b, x3, parameters);
toc

% tic
% x4 = zeros(n, 1);
% [x4, iter(4)] = iterate('gaussseidel', A, b, x4, parameters);
% toc

% tic
% x4 = zeros(n, 1);
% [x4, iter(4)] = trid_iterate('gaussseidel', A, b, x4, parameters);
% toc

%4
% tic
% x5 = zeros(n, 1);
% % parameters.omega = optimize_omega(A);
% parameters.omega = 1.94;
% [x5, iter(5)] = iterate('sor', A, b,x5, parameters);
% toc
% 
% tic
% x5 = zeros(n, 1);
% % parameters.omega = optimize_omega(A);
% parameters.omega = 1.94;
% [x5, iter(5)] = trid_iterate('sor', A, b,x5, parameters);
% toc

% %5
% tic
% x6 = zeros(n, 1);
% x6 = descent(A, b, x6, parameters);
% toc
%
% tic
% x7 = zeros(n, 1);
% x7 = cg(A, b, x7, parameters);
% toc

% tic
% x8 = zeros(n, 1);
% x8 = trid_cg(A, b, x8, parameters);
% toc
% 
% tic
% x8 = zeros(n, 1);
% x8 = trid_cg_jacobi_preconditioner(A, b, x8, parameters);
% toc
