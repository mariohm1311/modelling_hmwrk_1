function [x,k,p] = descent(A,b,x,parameters)
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

    % Prepare plot if n == 2
    if parameters.print   
        if n == 2
            % create new figure
            figure; 
            % prepare grid to plot contour
            [X,Y] = meshgrid(linspace(-2,12,200),linspace(-7,7,200)); 
            % compute the phi function at the grid points
            PHI = zeros(200,200); 
            for i = 1:200
                for j = 1:200
                    u = [X(i,j);Y(i,j)]; 
                    PHI(i,j) = 0.5*u'*A*u - b'*u;
                end
            end
            % Do the contour plot
            contour(X,Y,PHI,50)
            % Intialize the line object, with the data of the inital guess
            lh = line('XData',x(1),'YData',x(2),'Marker','x','Color','k');
        end
    end

    % Compute b norm bn
    bn = norm(b);
    %% Initialize r for first iteration
    r = b - A*x;
    counter = 0;
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
           % Update plot if n == 2
           if n == 2
               % Concatenate the new point to the line object
               lh.XData = [lh.XData,x(1)];
               lh.YData = [lh.YData,x(2)];
           end   
       end
       
       if mod(k, parameters.step_iter) == 0
            counter = counter + 1;
            p(counter) = rn/bn;
       end
       
       if mod(k, parameters.step_iter) == 0
            counter = counter + 1;
            p(counter) = rn/bn;
        end
       % Check the exit condition based on new residual
       if rn < parameters.tol*bn
            counter = counter + 1;
            p(counter) = rn/bn;
           return % This will stop the execution of this function and return immediately to the main program
       end
    end
    
    %% Raise error if maximum number of iterations reached
    error('Max iter reached');
end

    