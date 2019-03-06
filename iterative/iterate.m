function [x,k,iter_arr,p] = iterate(method,A,b,x,parameters)

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
counter = 0;
iter_arr = [];
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
    
    if mod(k, parameters.step_iter) == 0
        counter = counter + 1;
        iter_arr(counter) = k;
        p(counter) = rn/bn;
    end

    % Check the exit condition based on new residual
    if rn < bn*parameters.tol
       counter = counter + 1;
       iter_arr(counter) = k;
       p(counter) = rn/bn;
       return % This will stop the execution of this function and return immediately to the main program
    end
end
error('Maxiter reached');
end

