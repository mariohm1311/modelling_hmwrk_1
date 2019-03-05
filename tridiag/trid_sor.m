function x = trid_sor(A,b,x,omega)
    D = sparse(length(A),length(A));
    D = spdiags(spdiags(A,0),0,D); 

    x = fsub(D/omega + tril(A) - D,b - (D*(omega - 1)/omega + triu(A) - D)*x);
end