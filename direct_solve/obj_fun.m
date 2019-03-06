function conv = obj_fun(omega, A)
%     parameters.maxiter = 10;
%     n = length(b);
%     parameters.omega = omega;
%     x = zeros(n, 1);
%     x = iterate('sor', A, b, x, parameters);
%     conv = norm(b - A*x)/norm(b);
    M = diag(diag(A)/omega) + tril(A) - diag(diag(A));
    invM = inv(M);
    T = -invM*(A - M);
    conv = max(abs(eigs(T)));
end