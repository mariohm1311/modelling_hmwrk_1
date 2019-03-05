function [x] = trid_LUsolve(LU,b)
    y = trid_fsub(LU,b);
    x = trid_LUbsub(LU,y);
end