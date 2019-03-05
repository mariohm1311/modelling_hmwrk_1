function x = trid_cg(A,b,x,parameters)
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

    %% Initialize beta, v, r for first iteration
    r = b - A*x;
    v = r;
    beta = 0;

    %% Main iteration loop
    for k = 1:n
       % Update the vector v
       v = r + beta * v;
       % Compute the alpha value
       alpha = dot(v,r)/(v'*(A*v));
       % Update the solution vector x
       x = x + alpha * v;
       % Update the residual vector r
       r = b - A*x;
       % Update the beta value for next iteration
       beta = -dot(r,A*v)/(v'*(A*v));
       % Compute the residual norm rn
       rn = norm(r);
       % Print messages
       if parameters.print
           fprintf('Iteration: %u, |r|/|b|: %g\n',k,rn/bn)
       end
       % Check the exit condition based on new residual
       if rn < bn*parameters.tol
           return % This will stop the execution of this function and return immediately to the main program
       end
    end

    %% Raise error if maximum number of iterations reached
    error('Max iter reached');
end


