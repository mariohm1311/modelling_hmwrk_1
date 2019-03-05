function [x] = trid_LUbsub(U,b)
    n = length(b);
    x = zeros(n,1);
    
    x(n) = b(n);
    for i = (n-1):-1:1
        x(i) = b(i) - U(i,i+1)*x(i+1);
    end
end