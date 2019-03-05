function inv = trid_LUinv(LU)
    n = length(LU);
    inv = sparse(n, n);
    I = eye(n);
    
    for i = 1:n
        inv(:, i) = trid_LUsolve(LU, I(:, i));
    end
end