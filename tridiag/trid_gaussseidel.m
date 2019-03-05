function x = trid_gaussseidel(A,b,x)
    D = sparse(length(A), length(A));
    x = trid_fsub(tril(A), b - (triu(A) - spdiags(spdiags(A,0),0,D))*x);
end