function x = trid_descent(A,b,x,parameters)
    %
    % Input --> A is the matrix of the linear system
    %       --> b is the right hand side vector of the linear system
    %       --> x is the unknowns vector containing the initial guess
    %       --> parameters is a structure containing the tolerance, the maximum
    %           number of iterations and the print flag
    %
    % Output
    %       --> x is the solution vector of the linear system

    % Size of problem
    n = size(A,1);

    % Compute b norm bn
    bn = norm(b);
    
    %% Initialize r for first iteration
    r = b - A*x;

    %% Main iteration loop
    for k = 1:parameters.maxiter
       % Update the value of alpha
       alpha = dot(r, r)/dot(r,(A*r));
       % Update the solution vector x
       x = x + alpha*r;
       % Update the residual vector r
       r = b - A*x;
       % Compute the residual norm rn
       rn = norm(r);
       % Print messages
       if parameters.print
           fprintf('Iteration: %u, |r|/|b|: %g\n',k,rn/bn)
       end
       % Check the exit condition based on new residual
       if rn < parameters.tol*bn
           return % This will stop the execution of this function and return immediately to the main program
       end
    end
    
    %% Raise error if maximum number of iterations reached
    error('Max iter reached');
end

    