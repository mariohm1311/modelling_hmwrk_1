function x = jacobi(A,b,x)
x = x + (b - A*x)./diag(A);
end