% clear;

% define function using symbolic toolbox
syms f(x, y);
f(x, y) = (x^5) * exp(- x^2 - y^2);
h = hessian(f);
gradf = gradient(f);

% plot function
figure("Name", "Function plot");
fsurf(f);
xlabel("x");
ylabel("y");
zlabel("f(x, y)");

% epsilon for all runs
epsilon = 0.01;

% constant step
step = 0.005;

% start from (0, 0)
f_point = [0 0];
points_zero_const = zeros([1 2]);
points_zero_const(1, :) = f_point;
k = 1;

gradf_value = double(gradf(f_point(1), f_point(2)))';

while norm(gradf_value) >= epsilon
    mk = 0;
    
    while min( double(eig(h(f_point(1), f_point(2)) + mk * eye(2))) > 0 ) == 0
        mk = mk + 1;
    end

    dk = double(inv( h(f_point(1), f_point(2)) + mk * eye(2) )) ;
    f_point = f_point - step * ( dk * gradf_value' )';
    points_zero_const(end + 1, :) = f_point;
    gradf_value = double(gradf(f_point(1), f_point(2)))';
    k = k + 1;
end

% start from (-1, 1)
f_point = [-1 1];
points_one_const = zeros([1 2]);
points_one_const(1, :) = f_point;
k = 1;

gradf_value = double(gradf(f_point(1), f_point(2)))';

while norm(gradf_value) >= epsilon
    mk = 0;
    
    while min( double(eig(h(f_point(1), f_point(2)) + mk * eye(2))) > 0 ) == 0
        mk = mk + 1;
    end

    dk = double(inv( h(f_point(1), f_point(2)) + mk * eye(2) )) ;
    f_point = f_point - step * ( dk * gradf_value' )'; 
    points_one_const(end + 1, :) = f_point;
    gradf_value = double(gradf(f_point(1), f_point(2)))';
    k = k + 1;
end

% start from (1, -1)
f_point = [1 -1];
points_two_const = zeros([1 2]);
points_two_const(1, :) = f_point;
k = 1;

gradf_value = double(gradf(f_point(1), f_point(2)))';

while norm(gradf_value) >= epsilon
    mk = 0;
    
    while min( double(eig(h(f_point(1), f_point(2)) + mk * eye(2))) > 0 ) == 0
        mk = mk + 1;
    end

    dk = double(inv( h(f_point(1), f_point(2)) + mk * eye(2) )) ;
    f_point = f_point - step * ( dk * gradf_value' )'; 
    points_two_const(end + 1, :) = f_point;
    gradf_value = double(gradf(f_point(1), f_point(2)))';
    k = k + 1;
end

% step that minimizes condition

% start from (0, 0)
f_point = [0 0];
points_zero_min = zeros([1 2]);
points_zero_min(1, :) = f_point;
k = 1;

gradf_value = double(gradf(f_point(1), f_point(2)))';
[step, ~] = minimize_1d_function(f, f_point, gradf_value);

while norm(gradf_value) >= epsilon
    mk = 0;
    
    while min( double(eig(h(f_point(1), f_point(2)) + mk * eye(2))) > 0 ) == 0
        mk = mk + 1;
    end

    dk = double(inv( h(f_point(1), f_point(2)) + mk * eye(2) )) ;
    f_point = f_point - step * ( dk * gradf_value' )'; 
    points_zero_min(end + 1, :) = f_point;
    gradf_value = double(gradf(f_point(1), f_point(2)))';
    [step, ~] = minimize_1d_function(f, f_point, ( dk * gradf_value' )');
    k = k + 1;
end

% start from (-1, 1)
f_point = [-1 1];
points_one_min = zeros([1 2]);
points_one_min(1, :) = f_point;
k = 1;

gradf_value = double(gradf(f_point(1), f_point(2)))';
[step, ~] = minimize_1d_function(f, f_point, gradf_value);

while norm(gradf_value) >= epsilon
    mk = 0;
    
    while min( double(eig(h(f_point(1), f_point(2)) + mk * eye(2))) > 0 ) == 0
        mk = mk + 1;
    end

    dk = double(inv( h(f_point(1), f_point(2)) + mk * eye(2) )) ;
    f_point = f_point - step * ( dk * gradf_value' )';
    points_one_min(end + 1, :) = f_point;
    gradf_value = double(gradf(f_point(1), f_point(2)))';
    [step, ~] = minimize_1d_function(f, f_point, ( dk * gradf_value' )');
    k = k + 1;
end

% start from (1, -1)
f_point = [1 -1];
points_two_min = zeros([1 2]);
points_two_min(1, :) = f_point;
k = 1;

gradf_value = double(gradf(f_point(1), f_point(2)))';
[step, ~] = minimize_1d_function(f, f_point, gradf_value);

while norm(gradf_value) >= epsilon
    mk = 0;
    
    while min( double(eig(h(f_point(1), f_point(2)) + mk * eye(2))) > 0 ) == 0
        mk = mk + 1;
    end

    dk = double(inv( h(f_point(1), f_point(2)) + mk * eye(2) )) ;
    f_point = f_point - step * ( dk * gradf_value' )';
    points_two_min(end + 1, :) = f_point;
    gradf_value = double(gradf(f_point(1), f_point(2)))';
    [step, ~] = minimize_1d_function(f, f_point, ( dk * gradf_value' )');
    k = k + 1;
end


% armijo rule

% arbitrary constant selection
a = 0.001;
b = 0.2;
s = 1;

% start from (0, 0)
f_point = [0 0];
points_zero_arm = zeros([1 2]);
points_zero_arm(1, :) = f_point;
k = 1;
step = 1; % initial step

gradf_value = double(gradf(f_point(1), f_point(2)))';

while norm(gradf_value) >= epsilon
    f_point_old = f_point;
    mk = 0;
    
    while min( double(eig(h(f_point(1), f_point(2)) + mk * eye(2))) > 0 ) == 0
        mk = mk + 1;
    end

    dk = double(inv( h(f_point(1), f_point(2)) + mk * eye(2) )) ;
    f_point = f_point - step * ( dk * gradf_value' )';
    % recompute step
    mk = 1;
    while f(f_point_old(1), f_point_old(2)) - f(f_point(1), f_point(2)) < ...
            - a * b^mk * s * (step * dk * (gradf_value'))
        mk = mk + 1;
    end
    step = s * b^mk;
    points_zero_arm(end + 1, :) = f_point;
    gradf_value = double(gradf(f_point(1), f_point(2)))';
    k = k + 1;
end

% start from (-1, 1)
f_point = [-1 1];
points_one_arm = zeros([1 2]);
points_one_arm(1, :) = f_point;
k = 1;
step = 1; % initial step

gradf_value = double(gradf(f_point(1), f_point(2)))';

while norm(gradf_value) >= epsilon
    f_point_old = f_point;
    mk = 0;
    
    while min( double(eig(h(f_point(1), f_point(2)) + mk * eye(2))) > 0 ) == 0
        mk = mk + 1;
    end

    dk = double(inv( h(f_point(1), f_point(2)) + mk * eye(2) )) ;
    f_point = f_point - step * ( dk * gradf_value' )';
    % recompute step
    mk = 1;
    while f(f_point_old(1), f_point_old(2)) - f(f_point(1), f_point(2)) < ...
            - a * b^mk * s * (step * dk * (gradf_value'))
        mk = mk + 1;
    end
    step = s * b^mk;
    points_one_arm(end + 1, :) = f_point;
    gradf_value = double(gradf(f_point(1), f_point(2)))';
    k = k + 1;
end

% start from (1, -1)
f_point = [1 -1];
points_two_arm = zeros([1 2]);
points_two_arm(1, :) = f_point;
k = 1;
step = 1; % initial step

gradf_value = double(gradf(f_point(1), f_point(2)))';

while norm(gradf_value) >= epsilon
    f_point_old = f_point;
    mk = 0;
    
    while min( double(eig(h(f_point(1), f_point(2)) + mk * eye(2))) > 0 ) == 0
        mk = mk + 1;
    end

    dk = double(inv( h(f_point(1), f_point(2)) + mk * eye(2) )) ;
    f_point = f_point - step * ( dk * gradf_value' )';
    % recompute step
    mk = 1;
    while f(f_point_old(1), f_point_old(2)) - f(f_point(1), f_point(2)) < ...
            - a * b^mk * s * (step * dk * (gradf_value'))
        mk = mk + 1;
    end
    step = s * b^mk;
    points_two_arm(end + 1, :) = f_point;
    gradf_value = double(gradf(f_point(1), f_point(2)))';
    k = k + 1;
end

% visualise results
% constant step
figure("Name", "Constant step = 0.005, Starting point = (0, 0)");
fsurf(f);
hold on;
xlabel("x");
ylabel("y");
zlabel("f(x, y)");
plot3(points_zero_const(:, 1), points_zero_const(:, 2), f(points_zero_const(:, 1), points_zero_const(:, 2)), "r*");
saveas(gcf, [pwd '/figs/lm_const_step_zero.png']);
figure("Name", "f value at each iteration, constant step = 0.005, starting point = (0, 0)");
size_zr = size(points_zero_const);
plot(1:size_zr(1), f(points_zero_const(:, 1), points_zero_const(:, 2)));
xlabel("iteration no");
ylabel("function value");
saveas(gcf, [pwd '/figs/lm_const_step_zero_iter_fval.png']);
lm_const_step_zero_iter = size_zr;

figure("Name", "Constant step = 0.005, Starting point = (-1, 1)");
fsurf(f);
hold on;
xlabel("x");
ylabel("y");
zlabel("f(x, y)");
plot3(points_one_const(:, 1), points_one_const(:, 2), f(points_one_const(:, 1), points_one_const(:, 2)), "r*");
saveas(gcf, [pwd '/figs/lm_const_step_one.png']);
figure("Name", "f value at each iteration, constant step = 0.005, starting point = (-1, 1)");
size_zr = size(points_one_const);
plot(1:size_zr(1), f(points_one_const(:, 1), points_one_const(:, 2)));
xlabel("iteration no");
ylabel("function value");
saveas(gcf, [pwd '/figs/lm_const_step_one_iter_fval.png']);
lm_const_step_one_iter = size_zr;

figure("Name", "Constant step = 0.005, Starting point = (1, -1)");
fsurf(f);
hold on;
xlabel("x");
ylabel("y");
zlabel("f(x, y)");
plot3(points_two_const(:, 1), points_two_const(:, 2), f(points_two_const(:, 1), points_two_const(:, 2)), "r*");
saveas(gcf, [pwd '/figs/lm_const_step_two.png']);
figure("Name", "f value at each iteration, constant step = 0.005, starting point = (1, -1)");
size_zr = size(points_two_const);
plot(1:size_zr(1), f(points_two_const(:, 1), points_two_const(:, 2)));
xlabel("iteration no");
ylabel("function value");
saveas(gcf, [pwd '/figs/lm_const_step_two_iter_fval.png']);
lm_const_step_two_iter = size_zr;

% minimal step
figure("Name", "Minimizing step, Starting point = (0, 0)");
fsurf(f);
hold on;
xlabel("x");
ylabel("y");
zlabel("f(x, y)");
plot3(points_zero_min(:, 1), points_zero_min(:, 2), f(points_zero_min(:, 1), points_zero_min(:, 2)), "r*");
saveas(gcf, [pwd '/figs/lm_min_step_zero.png']);
figure("Name", "f value at each iteration, minimizing step, starting point = (0, 0)");
size_zr = size(points_zero_min);
plot(1:size_zr(1), f(points_zero_min(:, 1), points_zero_min(:, 2)));
xlabel("iteration no");
ylabel("function value");
saveas(gcf, [pwd '/figs/lm_min_step_zero_iter_fval.png']);
lm_min_step_zero_iter = size_zr;

figure("Name", "Minimizing step, Starting point = (-1, 1)");
fsurf(f);
hold on;
xlabel("x");
ylabel("y");
zlabel("f(x, y)");
plot3(points_one_min(:, 1), points_one_min(:, 2), f(points_one_min(:, 1), points_one_min(:, 2)), "r*");
saveas(gcf, [pwd '/figs/lm_min_step_one.png']);
figure("Name", "f value at each iteration, minimizing step, starting point = (-1, 1)");
size_zr = size(points_one_min);
plot(1:size_zr(1), f(points_one_min(:, 1), points_one_min(:, 2)));
xlabel("iteration no");
ylabel("function value");
saveas(gcf, [pwd '/figs/lm_min_step_one_iter_fval.png']);
lm_min_step_one_iter = size_zr;

figure("Name", "Minimizing, Starting point = (1, -1)");
fsurf(f);
hold on;
xlabel("x");
ylabel("y");
zlabel("f(x, y)");
plot3(points_two_min(:, 1), points_two_min(:, 2), f(points_two_min(:, 1), points_two_min(:, 2)), "r*");
saveas(gcf, [pwd '/figs/lm_min_step_two.png']);
figure("Name", "f value at each iteration, minimizing step, starting point = (1, -1)");
size_zr = size(points_two_min);
plot(1:size_zr(1), f(points_two_min(:, 1), points_two_min(:, 2)));
xlabel("iteration no");
ylabel("function value");
saveas(gcf, [pwd '/figs/lm_min_step_two_iter_fval.png']);
lm_min_step_two_iter = size_zr;

% armijo's rule
figure("Name", "Armijo's rule step, Starting point = (0, 0)");
fsurf(f);
hold on;
xlabel("x");
ylabel("y");
zlabel("f(x, y)");
plot3(points_zero_arm(:, 1), points_zero_arm(:, 2), f(points_zero_arm(:, 1), points_zero_arm(:, 2)), "r*");
saveas(gcf, [pwd '/figs/lm_arm_step_zero.png']);
figure("Name", "f value at each iteration, armijo's rule step, starting point = (0, 0)");
size_zr = size(points_zero_arm);
plot(1:size_zr(1), f(points_zero_arm(:, 1), points_zero_arm(:, 2)));
xlabel("iteration no");
ylabel("function value");
saveas(gcf, [pwd '/figs/lm_arm_step_zero_iter_fval.png']);
lm_arm_step_zero_iter = size_zr;

figure("Name", "Armijo's rule step, Starting point = (-1, 1)");
fsurf(f);
hold on;
xlabel("x");
ylabel("y");
zlabel("f(x, y)");
plot3(points_one_arm(:, 1), points_one_arm(:, 2), f(points_one_arm(:, 1), points_one_arm(:, 2)), "r*");
saveas(gcf, [pwd '/figs/lm_arm_step_one.png']);
figure("Name", "f value at each iteration, armijo's rule step, starting point = (-1, 1)");
size_zr = size(points_one_arm);
plot(1:size_zr(1), f(points_one_arm(:, 1), points_one_arm(:, 2)));
xlabel("iteration no");
ylabel("function value");
saveas(gcf, [pwd '/figs/lm_arm_step_one_iter_fval.png']);
lm_arm_step_one_iter = size_zr;

figure("Name", "Armijo's rule step, Starting point = (1, -1)");
fsurf(f);
hold on;
xlabel("x");
ylabel("y");
zlabel("f(x, y)");
plot3(points_two_arm(:, 1), points_two_arm(:, 2), f(points_two_arm(:, 1), points_two_arm(:, 2)), "r*");
saveas(gcf, [pwd '/figs/lm_arm_step_two.png']);
figure("Name", "f value at each iteration, armijo's rule step, starting point = (1, -1)");
size_zr = size(points_two_arm);
plot(1:size_zr(1), f(points_two_arm(:, 1), points_two_arm(:, 2)));
xlabel("iteration no");
ylabel("function value");
saveas(gcf, [pwd '/figs/lm_arm_step_two_iter_fval.png']);
lm_arm_step_two_iter = size_zr;