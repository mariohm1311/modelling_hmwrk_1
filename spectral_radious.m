function spectral_radius(A)
w = (1:0.01:2);
for i = 1:length(w)
    M = diag(diag(A)/w(i)) + tril(A) - diag(diag(A));
    invM = inv(M);
    T = -invM*(A - M);
rho(i) = max(abs(eigs(T)));
end
disp(rho);
plot(w, rho);
end