function x = trid_jacobi(A,b,x)
    x = x + (b - A*x)./spdiags(A,0);
end