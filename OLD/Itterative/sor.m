function x = sor(A,b,x,omega)
% x = x + inverse*(b - A*x);
x = fsub(diag(diag(A))/omega + tril(A) - diag(diag(A)),b - (diag(diag(A))*(omega - 1)/omega + triu(A) - diag(diag(A)))*x);
end