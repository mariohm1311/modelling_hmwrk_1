function A = LUfactor(A)

n = size(A,1);
 
for i = 1:n
    for j = i:n %computing L
        A(j,i) = A(j,i)-(A(j,1:(i-1))*A(1:(i-1),i));
    end
    for k = i+1:n %Computing U
        A(i,k) = (A(i,k)-(A(i,1:(i-1))*A(1:(i-1),k)))/A(i,i);
    end
end
end

