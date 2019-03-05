clear
addpath('iterative', 'direct_solve');
problem = load('heatI.mat', 'A', 'b');
%problemII = load('heatII.mat', 'A', 'b');
A = problem.A; b = problem.b;
%AII = problemII.A; bII = problemII.b;
n = length(b);
parameters.tol = 1e-8;
parameters.maxiter = 10000;
parameters.print = 0;

%1
%spy(AI);
% bandI = bandwidth(A);

% A = diag(1./diag(A))*A;
% b = diag(1./diag(A))*b;

%2
% 
% LU = LUfactor(A);
% x1 = LUsolve(LU, b);


% tic
% x2 = A\b;
% toc
% 
% %3
% tic
% x3 = zeros(n, 1);
% x3 = iterate('jacobi', A, b, x3, parameters);
% toc
% 
% tic
% x4 = zeros(n);
% x4 = iterate('gaussseidel', A, b, x4, parameters);
% toc
domega = (1.9:0.001:2);
itter = zeros(size(domega));
c = 0;
for i = domega
    c = c + 1;
    parameters.omega = i;
    disp(parameters.omega);
    x5 = zeros(n, 1);
    [x5, iter] = iterate('sor', A, b,x5, parameters);
    itter(c) = iter;
end

plot(domega, itter);

% disp(x1(1));
% disp(x2(1));
% disp(x3(1));
% disp(x4(1));
% disp(x5(1));