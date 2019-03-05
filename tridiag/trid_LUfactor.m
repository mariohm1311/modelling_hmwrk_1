function A = trid_LUfactor(A)
    n = size(A,1);
    
    for i = 2:n
        A(i-1,i) = A(i-1,i) / A(i-1,i-1);
        A(i,i) = A(i,i) - A(i,i-1)*A(i-1,i);
    end
end

