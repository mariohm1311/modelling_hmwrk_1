function [x] = LUbsub(U,b)
    n = length(b);
    x = zeros(n,1);
    
    for i = n:-1:1
        x(i) = (b(i) - U(i, (i + 1):n)*x((i + 1):n));
    end
end