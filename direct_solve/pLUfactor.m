function[A, p] = pLUfactor(A)

n = size(A,1);
p = zeros(1, n);
for w = 1:n
    p(w) = w;
end

for i = 1:n
    
    for j = i:n %computing L
        
        A(j,i) = A(j,i)-(A(j,1:(i-1))*A(1:(i-1),i));
    end
    
    %getting greater value
    greater_value = A(i, i);
    index = i;
    for q = (i + 1):n
        if A(q ,i) > greater_value
            greater_value = A(q, i);
            index = q;
        end
    end
    
    %swapping rows
    v1 = A(index, :);
    A(index, :) = A(i, :);
    A(i, :) = v1;
    
    %permutation vector
    p([i index]) = p([index i]);
    
    for k = i+1:n %Computing U
        A(i,k) = (A(i,k)-(A(i,1:(i-1))*A(1:(i-1),k)))/A(i,i);
    end
end

end