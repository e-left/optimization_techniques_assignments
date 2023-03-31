clear;

% define values for V
V = 85:115;

% define upper and lower bounds for x
lb = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
ub = [54.13, 21.56, 34.08, 49.19, 33.05, 21.84, 29.96, 24.87, ...
      47.24, 33.97, 26.89, 32.76, 39.98, 37.12, 53.83, 61.65, 59.73];
ub = ub - 0.001;

% define equality constraints
Aeq = [-1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; ...
       0, 1, 0, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0; ...
       0, 0, 0, 1, 0, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0; ...
       1, 0, 0, 0, -1, -1, 0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0; ...
       0, 0, 1, 0, 0, 0, 0, 1, 1, 0, -1, -1, -1, 0, 0, 0, 0; ...
       0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, -1, -1, 0, 0; ...
       0, 0, 0,0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, -1; ...
       0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, -1, 0; ...
       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1;];

x = zeros([length(V) 17]);
fval = zeros([length(V) 1]);
generations = zeros([length(V) 1]);

for k = 1:length(V)
    Vt = V(k);
    fprintf("Solving problem for V = %d\n", Vt)
    beq = [-Vt; 0; 0; 0; 0; 0; 0; 0; Vt];
    % solve the problem 
    obj_fun = @(x) objective_function(x, Vt);
    options = optimoptions('ga','ConstraintTolerance',1e-6,'PlotFcn', @gaplotbestf);
    [xt, fvalt, exitflag, output, population, scores] = ...
        ga(obj_fun, 17, [], [], Aeq, beq, lb, ub, [], options);
    % save values
    x(k, :) = xt(:);
    fval(k) = fvalt;
    generations(k) = output.generations;
end

