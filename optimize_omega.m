% function [omega, values, fcvector, fdvector] = optimize_omega(iters_in_SOR, A, b, parameters)
% parameters.maxiter = iters_in_SOR;
% n = length(b);
% phi = (1 + sqrt(5))/2;
% a = 1;
% b = 2;
% tau = 1e-5;
% c = a + (b - a) / phi;
% parameters.omega = c;
% x = zeros(n, 1);
% x = iterate('sor', A, b, x, parameters);
% fc = norm(b - A*x)/norm(b);
% d = b - (b - a) / phi;
% parameters.omega = d;
% x = zeros(n, 1);
% x = iterate('sor', A, b, x, parameters);
% fd = norm(b - A*x)/norm(b);
% i = 0;
% while abs(c - d) > tau 
%     i = i + 1;
%     values(i) = (b + a)/2;
%     if fc > fd
%         b = d;
%     else
%         a = c;
%     end
%     c = a + (b - a) / phi;
%     parameters.omega = c;
%     x = zeros(n, 1);
%     x = iterate('sor', A, b, x, parameters);
%     fc = norm(b - A*x)/norm(b);
%     fcvector(i) = fc;
%     d = b - (b - a) / phi;
%     parameters.omega = d;
%     x = zeros(n, 1);
%     x = iterate('sor', A, b, x, parameters);
%     fd = norm(b - A*x)/norm(b);
%     fdvector(i) = fd;
% end
% omega = (a + b)/2;
function [omega] = optimize_omega(iters_in_SOR, A, b, parameters)
    objfun = @(omega)(obj_fun(omega, A));
    omega = fminsearch(objfun, 1.5);
end