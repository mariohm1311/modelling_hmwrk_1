function [x,k] = iterate(method,A,b,x,parameters)

%% Process method selection
switch method
    case 'jacobi'
        step = @(A,b,x)jacobi(A,b,x);
    case 'gaussseidel'
        step = @(A,b,x)gaussseidel(A,b,x);        
    case 'sor'
        step = @(A,b,x)sor(A,b,x,parameters.omega);
    otherwise
        error(['Method ',method,' not defined.']);
end

%% Compute b norm
bn = norm(b);

%% Main iteration loop
for k = 1:parameters.maxiter
    
    % Update x using the selected step function
    x = step(A,b,x);
    
    % Compute new residual
    r = b - A*x;
    
    % Compute the residual norm
    rn = norm(r);
    % Print messages
    if parameters.print
        fprintf('Iteration: %u, |r|/|b|: %g\n',k,rn/bn)
    end
    
    % Exit condition
    if rn <= parameters.tol * bn
        return
    end   
end
%     error('Reached max itterations');
error('Maxiter reached'); %NOT RAISING AN ERROR IN ORDER TO COMPUTE ONLY
% SOME ITERATIONS FOR OMEGA IN SOR
end

