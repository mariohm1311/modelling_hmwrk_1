function inv = LUinv(LU, p)
    n = length(LU, 1);
    inv = zeros(n, n);
    I = eye(n);
    
    for i = 1:n
        inv(:, i) = pLUsolve(LU, I(:, i), p);
    end
end