function det = pLUdet(LU, p)

counter = 0;
n = length(p);
for i = 1:n
    if p(i) ~= i && p(i) > i
        counter = counter + 1;
    end
end
det = prod(diag(LU));

if mod(counter, 2) ~= 0
    det = -det;
end
end