clear;

% define function using symbolic toolbox
syms f(x, y);
f(x, y) = (1/3) * x^2 + 3 * y^2;
gradf = gradient(f);

% plot function
figure("Name", "Function plot");
fsurf(f);
xlabel("x");
ylabel("y");
zlabel("f(x, y)");
saveas(gcf, [pwd '/figs/function_plot.png']);

% q1

% epsilon for all runs
epsilon = 0.001;
% arbitrary starting point
starting_point = [50 100];

% i
step = 0.1;

% number of steps, length, size of point in that order
points_q1_i = zeros([1 2]);

points_q1_i(1, :) = starting_point;

f_point = starting_point;
k = 1;
gradf_value = double(gradf(f_point(1), f_point(2)))';
while norm(gradf_value) >= epsilon
    f_point = f_point - step * gradf_value;
    points_q1_i(end + 1, :) = f_point;
    gradf_value = double(gradf(f_point(1), f_point(2)))';
    k = k + 1;
end

% show the  plots
figure("Name", "Constant step = 0.1, Starting point = (5, 10)");
fsurf(f);
hold on;
xlabel("x");
ylabel("y");
zlabel("f(x, y)");
plot3(points_q1_i(:, 1), points_q1_i(:, 2), f(points_q1_i(:, 1), points_q1_i(:, 2)), "r*");
saveas(gcf, [pwd '/figs/q1_1.png']);
figure("Name", "f value at each iteration, constant step =0.1, starting point = (5, 10)");
size_zr = size(points_q1_i(:, :));
plot(1:size_zr(1), f(points_q1_i(:, 1), points_q1_i(:, 2)));
xlabel("iteration no");
ylabel("function value");
saveas(gcf, [pwd '/figs/q1_1_iter_fval.png']);

% ii
step = 0.3;

% number of steps, length, size of point in that order
points_q1_ii = zeros([1 2]);

points_q1_ii(1, :) = starting_point;

f_point = starting_point;
k = 1;
gradf_value = double(gradf(f_point(1), f_point(2)))';
while norm(gradf_value) >= epsilon
    f_point = f_point - step * gradf_value;
    points_q1_ii(end + 1, :) = f_point;
    gradf_value = double(gradf(f_point(1), f_point(2)))';
    k = k + 1;
end

% show the  plots
figure("Name", "Constant step = 0.3, Starting point = (5, 10)");
fsurf(f);
hold on;
xlabel("x");
ylabel("y");
zlabel("f(x, y)");
plot3(points_q1_ii(:, 1), points_q1_ii(:, 2), f(points_q1_ii(:, 1), points_q1_ii(:, 2)), "r*");
saveas(gcf, [pwd '/figs/q1_2.png']);
figure("Name", "f value at each iteration, constant step =0.3, starting point = (5, 10)");
size_zr = size(points_q1_ii(:, :));
plot(1:size_zr(1), f(points_q1_ii(:, 1), points_q1_ii(:, 2)));
xlabel("iteration no");
ylabel("function value");
saveas(gcf, [pwd '/figs/q1_2_iter_fval.png']);

% iii
step = 3;

% number of steps, length, size of point in that order
points_q1_iii = zeros([1 2]);

points_q1_iii(1, :) = starting_point;

f_point = starting_point;
k = 1;
gradf_value = double(gradf(f_point(1), f_point(2)))';
while norm(gradf_value) >= epsilon
    f_point = f_point - step * gradf_value;
    points_q1_iii(end + 1, :) = f_point;
    gradf_value = double(gradf(f_point(1), f_point(2)))';
    k = k + 1;
end

% show the  plots
figure("Name", "Constant step = 3, Starting point = (5, 10)");
fsurf(f);
hold on;
xlabel("x");
ylabel("y");
zlabel("f(x, y)");
plot3(points_q1_iii(:, 1), points_q1_iii(:, 2), f(points_q1_iii(:, 1), points_q1_iii(:, 2)), "r*");
saveas(gcf, [pwd '/figs/q1_3.png']);
figure("Name", "f value at each iteration, constant step =3, starting point = (5, 10)");
size_zr = size(points_q1_iii(:, :));
plot(1:size_zr(1), f(points_q1_iii(:, 1), points_q1_iii(:, 2)));
xlabel("iteration no");
ylabel("function value");
saveas(gcf, [pwd '/figs/q1_3_iter_fval.png']);

% iv
step = 5;

% number of steps, length, size of point in that order
points_q1_iv = zeros([1 2]);

points_q1_iv(1, :) = starting_point;

f_point = starting_point;
k = 1;
gradf_value = double(gradf(f_point(1), f_point(2)))';
while norm(gradf_value) >= epsilon
    f_point = f_point - step * gradf_value;
    points_q1_iv(end + 1, :) = f_point;
    gradf_value = double(gradf(f_point(1), f_point(2)))';
    k = k + 1;
end

% show the  plots
figure("Name", "Constant step = 5, Starting point = (5, 10)");
fsurf(f);
hold on;
xlabel("x");
ylabel("y");
zlabel("f(x, y)");
plot3(points_q1_iv(:, 1), points_q1_iv(:, 2), f(points_q1_iv(:, 1), points_q1_iv(:, 2)), "r*");
saveas(gcf, [pwd '/figs/q1_4.png']);
figure("Name", "f value at each iteration, constant step =5, starting point = (5, 10)");
size_zr = size(points_q1_iv(:, :));
plot(1:size_zr(1), f(points_q1_iv(:, 1), points_q1_iv(:, 2)));
xlabel("iteration no");
ylabel("function value");
saveas(gcf, [pwd '/figs/q1_4_iter_fval.png']);

% q2-q3-q4
xlimits = [-10 5];
ylimits = [-8 12];

% q2
epsilon = 0.01;
step = 0.5;
sk = 5;
starting_point = [5 -5];

points_q2 = zeros([1 2]);
points_q2(1, :) = starting_point;

f_point = starting_point;
k = 1;
gradf_value = double(gradf(f_point(1), f_point(2)))';
while (norm(gradf_value) >= epsilon) && (k <= 50)
    xbarint = f_point - sk * gradf_value;
    [xbar, ybar] = projection_rect(xbarint , xlimits, ylimits);
    f_point = f_point + step * ([xbar, ybar] - f_point);
    points_q2(end + 1, :) = f_point;
    gradf_value = double(gradf(f_point(1), f_point(2)))';
    k = k + 1;
end

% visualise
figure("Name", "Constant step = 0.5, sk = 5, Starting point = (5, -5)");
fsurf(f);
hold on;
xlabel("x");
ylabel("y");
zlabel("f(x, y)");
plot3(points_q2(:, 1), points_q2(:, 2), f(points_q2(:, 1), points_q2(:, 2)), "r*");
saveas(gcf, [pwd '/figs/q2.png']);
figure("Name", "f value at each iteration, constant step = 0.5, sk = 5 , starting point = (5, -5)");
size_zr = size(points_q2(:, :));
plot(1:size_zr(1), f(points_q2(:, 1), points_q2(:, 2)));
xlabel("iteration no");
ylabel("function value");
saveas(gcf, [pwd '/figs/q2_iter_fval.png']);

% q3
epsilon = 0.01;
step = 0.1;
sk = 15;
starting_point = [-5 10];

points_q3 = zeros([1 2]);
points_q3(1, :) = starting_point;

f_point = starting_point;
k = 1;
gradf_value = double(gradf(f_point(1), f_point(2)))';
while norm(gradf_value) >= epsilon
    xbarint = f_point - sk * gradf_value;
    [xbar, ybar] = projection_rect(xbarint , xlimits, ylimits);
    f_point = f_point + step * ([xbar, ybar] - f_point);
    points_q3(end + 1, :) = f_point;
    gradf_value = double(gradf(f_point(1), f_point(2)))';
    k = k + 1;
end

% visualise
figure("Name", "Constant step = 0.1, sk = 15, Starting point = (-5, 10)");
fsurf(f);
hold on;
xlabel("x");
ylabel("y");
zlabel("f(x, y)");
plot3(points_q3(:, 1), points_q3(:, 2), f(points_q3(:, 1), points_q3(:, 2)), "r*");
saveas(gcf, [pwd '/figs/q3.png']);
figure("Name", "f value at each iteration, constant step = 0.1, sk = 15 , starting point = (-5, 10)");
size_zr = size(points_q3(:, :));
plot(1:size_zr(1), f(points_q3(:, 1), points_q3(:, 2)));
xlabel("iteration no");
ylabel("function value");
saveas(gcf, [pwd '/figs/q3_iter_fval.png']);

% q4
epsilon = 0.01;
step = 0.2;
sk = 0.1;
starting_point = [8 -10];

points_q4 = zeros([1 2]);
points_q4(1, :) = starting_point;

f_point = starting_point;
k = 1;
gradf_value = double(gradf(f_point(1), f_point(2)))';
while norm(gradf_value) >= epsilon
    xbarint = f_point - sk * gradf_value;
    [xbar, ybar] = projection_rect(xbarint , xlimits, ylimits);
    f_point = f_point + step * ([xbar, ybar] - f_point);
    points_q4(end + 1, :) = f_point;
    gradf_value = double(gradf(f_point(1), f_point(2)))';
    k = k + 1;
end

% visualise
figure("Name", "Constant step = 0.2, sk = 0.1, Starting point = (8, -10)");
fsurf(f);
hold on;
xlabel("x");
ylabel("y"
zlabel("f(x, y)");
plot3(points_q4(:, 1), points_q4(:, 2), f(points_q4(:, 1), points_q4(:, 2)), "r*");
saveas(gcf, [pwd '/figs/q4.png']);
figure("Name", "f value at each iteration, constant step = 0.2, sk = 0.1 , starting point = (8, -10)");
size_zr = size(points_q4(:, :));
plot(1:size_zr(1), f(points_q4(:, 1), points_q4(:, 2)));
xlabel("iteration no");
ylabel("function value");
saveas(gcf, [pwd '/figs/q4_iter_fval.png']);

close all;