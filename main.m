clear
addpath('Itterative', 'Direct_solve', 'gradient_descend');
problem = load('heatII.mat', 'A', 'b');
%problemII = load('heatII.mat', 'A', 'b');
A = problem.A; b = problem.b;
%AII = problemII.A; bII = problemII.b;
n = length(b);
parameters.tol = 1e-9;
parameters.maxiter = 10000000;
parameters.print = 1;

%1
%spy(AI);
bandI = bandwidth(A);

% A = diag(1./diag(A))*A;
% b = diag(1./diag(A))*b;

%2
% tic
% LU = LUfactor(A);
% x1 = LUsolve(LU, b);
% toc

tic
x2 = A\b;
toc

%3
% tic
% x3 = zeros(n, 1);
% iter = zeros(5, 1);
% [x3, iter(3)] = iterate('jacobi', A, b, x3, parameters);
% toc

% tic
% x4 = zeros(n, 1);
% [x4, iter(4)] = iterate('gausseidel', A, b, x4, parameters);
% toc
%4
% tic
% x5 = zeros(n, 1);
% [parameters.omega, p, fcvector, fdvector] = optimize_omega(10, A, b, parameters);
% plot(1:length(fcvector), fcvector, 1:length(fdvector), fdvector);
% % [x5, iter(5)] = iterate('sor', A, b,x5, parameters);
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

tic
x8 = zeros(n, 1);
x8 = cg_jacobi_preconditioner(A, b, x8, parameters);
toc

% tic
% x9 = zeros(n, 1);
% x9 = cg_cholesky_preconditioner(A, b, x9, parameters);
% toc
