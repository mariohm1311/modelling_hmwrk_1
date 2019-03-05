function x = gaussseidel(A,b,x)
    x = fsub(tril(A),b - (triu(A) - diag(diag(A)))*x);
end