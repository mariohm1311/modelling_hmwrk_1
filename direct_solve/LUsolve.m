function [x] = LUsolve(LU,b)
[y] = fsub(LU,b);
[x] = LUbsub(LU,y);
end