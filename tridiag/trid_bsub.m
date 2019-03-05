function [x] = trid_bsub(U,b)
    n = length(b);
    x = zeros(n,1);
    
    x(n) = b(n) / A(n,n);
    for i = (n-1):-1:1
        x(i) = (b(i) - U(i,i+1)*x(i+1)) / U(i,i);
    end
end