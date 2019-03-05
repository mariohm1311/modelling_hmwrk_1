function x = gaussseidel(A,b,x)
x = fsub(tril(A),b - (triu(A) - diag(diag(A)))*x);
% n = length(b);
% for i = 1:n
%     x(i) = (b(i) - A(i, 1:(i-1))*x(1:(i-1)) - A(i, (i+1):n)*x((i+1):n))/A(i,i);
% end
end