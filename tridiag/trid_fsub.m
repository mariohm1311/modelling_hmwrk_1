function [x] = trid_fsub(L,b)
    n = length(b);
    x = zeros(n,1);
    
    x(1) = b(1) / L(1,1);
    for k = 2:n
        x(k) = (b(k) - L(k, k-1) * x(k-1)) / L(k, k);
    end
end 