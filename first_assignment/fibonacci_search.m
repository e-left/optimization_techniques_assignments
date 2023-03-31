% clear;

% define function using the symbolic toolbox
syms f1(x);
syms f2(x);
syms f3(x);
f1(x) = (x - 2)^2 + x * log(x + 3);
f2(x) = 5^x + (2 - cos(x))^2;
f3(x) = exp(x) * (x^3 - 1) + (x - 1) * sin(x);

% define lower and upper limits
lower = -1;
upper = 3;

% plot functions on specified range
figure("Name", "f1(x) = (x-2)^2 + x*ln(x+3)")
fplot(f1, [lower, upper]);
xlabel("x");
ylabel("y");

figure("Name", "f2(x) = 5^x + (2 - cos(x))^2")
fplot(f2, [lower, upper]);
xlabel("x");
ylabel("y");

figure("Name", "f3(x) = exp(x) * (x^3 - 1) + (x - 1) * sin(x)")
fplot(f3, [lower, upper]);
xlabel("x");
ylabel("y");

% change l
n_l = 100;
start_l = 0.001;
end_l = 0.1;

ls = linspace(start_l, end_l, n_l);

iterations = zeros([n_l 3]);
calculations = zeros([n_l 3]);
lower_limits = zeros([n_l 1 3]);
upper_limits = zeros([n_l 1 3]);
% for every l value
for i = 1:n_l
    % get l
    l = ls(i);
    epsilon = 0.0001;

    compared = (upper - lower) / l;
    n_iterations = 1;
    while fibonacci(n_iterations) <= compared
        n_iterations = n_iterations + 1;
    end

    % set up search limits
    lower_1 = lower;
    upper_1 = upper;

    lower_2 = lower;
    upper_2 = upper;

    lower_3 = lower;
    upper_3 = upper;

    % initialize limit storing
    lower_limits(i, 1, :) = [lower_1 lower_2 lower_3];
    upper_limits(i, 1, :) = [upper_3 upper_3 upper_3];

    % implement the algorithm, run until convergence
    % f1
    x_k_1 = lower_1 + (fibonacci(n_iterations - 2) / fibonacci(n_iterations)) * (upper_1 - lower_1);
    x_k_2 = lower_1 + (fibonacci(n_iterations - 1) / fibonacci(n_iterations)) * (upper_1 - lower_1);
    lower_value_1 = f1(x_k_1);
    upper_value_1 = f1(x_k_2);
    iterations_1 = 1;
    while iterations_1 < n_iterations - 2
        if lower_value_1 > upper_value_1
            lower_1 = x_k_1;
            x_k_1 = x_k_2;
            lower_value_1 = upper_value_1;
            x_k_2 = lower_1 + (fibonacci(n_iterations - iterations_1 - 1) / fibonacci(n_iterations - iterations_1)) * (upper_1 - lower_1);
            upper_value_1 = f1(x_k_2);
        else
            upper_1 = x_k_2;
            x_k_2 = x_k_1;
            upper_value_1 = lower_value_1;
            x_k_1 = lower_1 + (fibonacci(n_iterations - iterations_1 - 2) / fibonacci(n_iterations - iterations_1)) * (upper_1 - lower_1);
            lower_value_1 = f1(x_k_1);
        end
        iterations_1 = iterations_1 + 1;
        lower_limits(i, iterations_1, 1) = lower_1;
        upper_limits(i, iterations_1, 1) = upper_1;
    end
    if lower_value_1 > upper_value_1
        lower_1 = x_k_1;
        x_k_1 = x_k_2;
        lower_value_1 = upper_value_1;
%         x_k_2 = lower_1 + (fibonacci(n_iterations - iterations_1 - 1) / fibonacci(n_iterations - iterations_1)) * (upper_1 - lower_1);
    else
        upper_1 = x_k_2;
%         x_k_2 = x_k_1;
        upper_value_1 = lower_value_1;
        x_k_1 = lower_1 + (fibonacci(n_iterations - iterations_1 - 2) / fibonacci(n_iterations - iterations_1)) * (upper_1 - lower_1);
    end
    lower_limits(i, iterations_1 + 1, 1) = lower_1;
    upper_limits(i, iterations_1 + 1, 1) = upper_1;
    if f1(x_k_1) > f1(x_k_1 + epsilon)
        lower_1 = x_k_1;
    else
        upper_1 = x_k_1 + epsilon;
    end
    lower_limits(i, iterations_1 + 2, 1) = lower_1;
    upper_limits(i, iterations_1 + 2, 1) = upper_1;
    
    % f2
    x_k_1 = lower_2 + (fibonacci(n_iterations - 2) / fibonacci(n_iterations)) * (upper_2 - lower_2);
    x_k_2 = lower_2 + (fibonacci(n_iterations - 1) / fibonacci(n_iterations)) * (upper_2 - lower_2);
    lower_value_2 = f2(x_k_1);
    upper_value_2 = f2(x_k_2);
    iterations_2 = 1;
    while iterations_2 < n_iterations - 2
        if lower_value_2 > upper_value_2
            lower_2 = x_k_1;
            x_k_1 = x_k_2;
            lower_value_2 = upper_value_2;
            x_k_2 = lower_2 + (fibonacci(n_iterations - iterations_2 - 1) / fibonacci(n_iterations - iterations_2)) * (upper_2 - lower_2);
            upper_value_2 = f2(x_k_2);
        else
            upper_2 = x_k_2;
            x_k_2 = x_k_1;
            upper_value_2 = lower_value_2;
            x_k_1 = lower_2 + (fibonacci(n_iterations - iterations_2 - 2) / fibonacci(n_iterations - iterations_2)) * (upper_2 - lower_2);
            lower_value_2 = f2(x_k_1);
        end
        iterations_2 = iterations_2 + 1;
        lower_limits(i, iterations_2, 2) = lower_2;
        upper_limits(i, iterations_2, 2) = upper_2;
    end
    if lower_value_2 > upper_value_2
        lower_2 = x_k_1;
        x_k_1 = x_k_2;
        lower_value_2 = upper_value_2;
%         x_k_2 = lower_2 + (fibonacci(n_iterations - iterations_2 - 1) / fibonacci(n_iterations - iterations_2)) * (upper_2 - lower_2);
    else
        upper_2 = x_k_2;
%         x_k_2 = x_k_1;
        upper_value_2 = lower_value_2;
        x_k_1 = lower_2 + (fibonacci(n_iterations - iterations_2 - 2) / fibonacci(n_iterations - iterations_2)) * (upper_2 - lower_2);
    end
    lower_limits(i, iterations_2 + 1, 2) = lower_2;
    upper_limits(i, iterations_2 + 1, 2) = upper_2;
    if f2(x_k_1) > f2(x_k_1 + epsilon)
        lower_2 = x_k_1;
    else
        upper_2 = x_k_1 + epsilon;
    end
    lower_limits(i, iterations_2 + 2, 2) = lower_2;
    upper_limits(i, iterations_2 + 2, 2) = upper_2;

    % f3
    x_k_1 = lower_3 + (fibonacci(n_iterations - 2) / fibonacci(n_iterations)) * (upper_3 - lower_3);
    x_k_2 = lower_3 + (fibonacci(n_iterations - 1) / fibonacci(n_iterations)) * (upper_3 - lower_3);
    lower_value_3 = f3(x_k_1);
    upper_value_3 = f3(x_k_2);
    iterations_3 = 1;
    while iterations_3 < n_iterations - 2
        if lower_value_3 > upper_value_3
            lower_3 = x_k_1;
            x_k_1 = x_k_2;
            lower_value_3 = upper_value_3;
            x_k_2 = lower_3 + (fibonacci(n_iterations - iterations_3 - 1) / fibonacci(n_iterations - iterations_3)) * (upper_3 - lower_3);
            upper_value_3 = f1(x_k_2);
        else
            upper_3 = x_k_2;
            x_k_2 = x_k_1;
            upper_value_3 = lower_value_3;
            x_k_1 = lower_3 + (fibonacci(n_iterations - iterations_3 - 2) / fibonacci(n_iterations - iterations_3)) * (upper_3 - lower_3);
            lower_value_3 = f3(x_k_1);
        end
        iterations_3 = iterations_3 + 1;
        lower_limits(i, iterations_3, 3) = lower_3;
        upper_limits(i, iterations_3, 3) = upper_3;
    end
    if lower_value_3 > upper_value_3
        lower_3 = x_k_1;
        x_k_1 = x_k_2;
        lower_value_3 = upper_value_3;
        x_k_2 = lower_3 + (fibonacci(n_iterations - iterations_3 - 1) / fibonacci(n_iterations - iterations_3)) * (upper_3 - lower_3);
    else
        upper_3 = x_k_2;
        x_k_2 = x_k_1;
        upper_value_3 = lower_value_3;
        x_k_1 = lower_3 + (fibonacci(n_iterations - iterations_3 - 2) / fibonacci(n_iterations - iterations_3)) * (upper_3 - lower_3);
    end
    lower_limits(i, iterations_3 + 1, 3) = lower_3;
    upper_limits(i, iterations_3 + 1, 3) = upper_3;
    if f3(x_k_1) > f3(x_k_1 + epsilon)
        lower_3 = x_k_1;
    else
        upper_3 = x_k_1 + epsilon;
    end
    lower_limits(i, iterations_3 + 2, 3) = lower_3;
    upper_limits(i, iterations_3 + 2, 3) = upper_3;

    % save the result
    iterations(i, :) = [n_iterations n_iterations n_iterations];
    calculations(i, :) = [n_iterations n_iterations n_iterations];
end

% plot results
figure("Name", "Number of iterations")
plot(ls, iterations(:, 1), ...
    ls, iterations(:, 2), ...
    ls, iterations(:, 3)...
    );
xlabel("l");
ylabel("iterations");
legend("f1", "f2", "f3");
saveas(gcf, [pwd '/figs/fibonacci/iterations_l.png']);

figure("Name", "Number of calculations")
plot(ls, calculations(:, 1), ...
    ls, calculations(:, 2), ...
    ls, calculations(:, 3) ...
    );
xlabel("l");
ylabel("calculations");
legend("f1", "f2", "f3");
saveas(gcf, [pwd '/figs/fibonacci/calculations_l.png']);

% plot search ranges per iteration for 3 values of l: smaller, midpoint
% value and higher value

plot_l_idx = 1;
figure("Name", sprintf("Lower and Upper search limit, l = %f", ls(plot_l_idx)))
plot(1:iterations(plot_l_idx, 1), lower_limits(plot_l_idx, 1:iterations(plot_l_idx, 1), 1), ...
    1:iterations(plot_l_idx, 1), upper_limits(plot_l_idx, 1:iterations(plot_l_idx, 1), 1), ...
    1:iterations(plot_l_idx, 2), lower_limits(plot_l_idx, 1:iterations(plot_l_idx, 2), 2), ...
    1:iterations(plot_l_idx, 2), upper_limits(plot_l_idx, 1:iterations(plot_l_idx, 2), 2), ...
    1:iterations(plot_l_idx, 3), lower_limits(plot_l_idx, 1:iterations(plot_l_idx, 3), 3), ...
    1:iterations(plot_l_idx, 3), upper_limits(plot_l_idx, 1:iterations(plot_l_idx, 3), 3) ...
    );
xlabel("iterations no");
ylabel("function value");
legend("lower(f1)", "upper(f1)", "lower(f2)", "upper(f2)", "lower(f3)", "upper(f3)");
saveas(gcf, [pwd '/figs/fibonacci/search_limits_0005.png']);

plot_l_idx = n_l / 2;
figure("Name", sprintf("Lower and Upper search limit, l = %f", ls(plot_l_idx)))
plot(1:iterations(plot_l_idx, 1), lower_limits(plot_l_idx, 1:iterations(plot_l_idx, 1), 1), ...
    1:iterations(plot_l_idx, 1), upper_limits(plot_l_idx, 1:iterations(plot_l_idx, 1), 1), ...
    1:iterations(plot_l_idx, 2), lower_limits(plot_l_idx, 1:iterations(plot_l_idx, 2), 2), ...
    1:iterations(plot_l_idx, 2), upper_limits(plot_l_idx, 1:iterations(plot_l_idx, 2), 2), ...
    1:iterations(plot_l_idx, 3), lower_limits(plot_l_idx, 1:iterations(plot_l_idx, 3), 3), ...
    1:iterations(plot_l_idx, 3), upper_limits(plot_l_idx, 1:iterations(plot_l_idx, 3), 3) ...
    );
xlabel("iterations no");
ylabel("function value");
legend("lower(f1)", "upper(f1)", "lower(f2)", "upper(f2)", "lower(f3)", "upper(f3)");
saveas(gcf, [pwd '/figs/fibonacci/search_limits_001.png']);

plot_l_idx = n_l;
figure("Name", sprintf("Lower and Upper search limit, l = %f", ls(plot_l_idx)))
plot(1:iterations(plot_l_idx, 1), lower_limits(plot_l_idx, 1:iterations(plot_l_idx, 1), 1), ...
    1:iterations(plot_l_idx, 1), upper_limits(plot_l_idx, 1:iterations(plot_l_idx, 1), 1), ...
    1:iterations(plot_l_idx, 2), lower_limits(plot_l_idx, 1:iterations(plot_l_idx, 2), 2), ...
    1:iterations(plot_l_idx, 2), upper_limits(plot_l_idx, 1:iterations(plot_l_idx, 2), 2), ...
    1:iterations(plot_l_idx, 3), lower_limits(plot_l_idx, 1:iterations(plot_l_idx, 3), 3), ...
    1:iterations(plot_l_idx, 3), upper_limits(plot_l_idx, 1:iterations(plot_l_idx, 3), 3) ...
    );
xlabel("iterations no");
ylabel("function value");
legend("lower(f1)", "upper(f1)", "lower(f2)", "upper(f2)", "lower(f3)", "upper(f3)");
saveas(gcf, [pwd '/figs/fibonacci/search_limits_01.png']);

close all;