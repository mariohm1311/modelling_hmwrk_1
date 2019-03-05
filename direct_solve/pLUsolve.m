function x = pLUsolve(LU, b, p)
    n = length(b);
    
    for i = 1:n
        if p(i) ~= i && p(i) > i
            b([i p(i)]) = b([p(i) i]);
        end
    end

    x = LUsolve(LU, b);
end