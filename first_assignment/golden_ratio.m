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

    % count the iterations, start from 1
    iterations_1 = 1;
    iterations_2 = 1;
    iterations_3 = 1;

    % count the calculations, start from 0 
    % (don't take into account initial calculations)
    calculations_1 = 0;
    calculations_2 = 0;
    calculations_3 = 0;

    % set up search limits
    gamma = 0.618;

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
    lower_value_1 = f1(lower_1 + (1 - gamma) * (upper_1 - lower_1));
    upper_value_1 = f1(lower_1 + gamma * (upper_1 - lower_1));
    while upper_1 - lower_1 >= l
        if lower_value_1 > upper_value_1 
           lower_1 = lower_1 + (1 - gamma) * (upper_1 - lower_1);
           lower_value_1 = upper_value_1;
           upper_value_1 = f1(lower_1 + gamma * (upper_1 - lower_1));
        else
            upper_1 = lower_1 + gamma * (upper_1 - lower_1);
            upper_value_1 = lower_value_1;
            lower_value_1 = f1(lower_1 + (1 - gamma) * (upper_1 - lower_1));
        end

        iterations_1 = iterations_1 + 1;
        calculations_1 = calculations_1 + 1;

        lower_limits(i, iterations_1, 1) = lower_1;
        upper_limits(i, iterations_1, 1) = upper_1;
    end

    % f2
    lower_value_2 = f2(lower_2 + (1 - gamma) * (upper_2 - lower_2));
    upper_value_2 = f2(lower_2 + gamma * (upper_2 - lower_2));
    while upper_2 - lower_2 >= l
        if lower_value_2 > upper_value_2 
           lower_2 = lower_2 + (1 - gamma) * (upper_2 - lower_2);
           lower_value_2 = upper_value_2;
           upper_value_2 = f2(lower_2 + gamma * (upper_2 - lower_2));
        else
            upper_2 = lower_2 + gamma * (upper_2 - lower_2);
            upper_value_2 = lower_value_2;
            lower_value_2 = f2(lower_2 + (1 - gamma) * (upper_2 - lower_2));
        end

        iterations_2 = iterations_2 + 1;
        calculations_2 = calculations_2 + 1;

        lower_limits(i, iterations_2, 2) = lower_2;
        upper_limits(i, iterations_2, 2) = upper_2;
    end

    % f3
    lower_value_3 = f3(lower_3 + (1 - gamma) * (upper_3 - lower_3));
    upper_value_3 = f3(lower_3 + gamma * (upper_3 - lower_3));
    while upper_3 - lower_3 >= l
        if lower_value_3 > upper_value_3 
           lower_3 = lower_3 + (1 - gamma) * (upper_3 - lower_3);
           lower_value_3 = upper_value_3;
           upper_value_3 = f3(lower_3 + gamma * (upper_3 - lower_3));
        else
            upper_3 = lower_3 + gamma * (upper_3 - lower_3);
            upper_value_3 = lower_value_3;
            lower_value_3 = f3(lower_3 + (1 - gamma) * (upper_3 - lower_3));
        end

        iterations_3 = iterations_3 + 1;
        calculations_3 = calculations_3 + 1;

        lower_limits(i, iterations_3, 3) = lower_3;
        upper_limits(i, iterations_3, 3) = upper_3;
    end   

    % save the result
    iterations(i, :) = [iterations_1 iterations_2 iterations_3];
    calculations(i, :) = [calculations_1 calculations_2 calculations_3];
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
saveas(gcf, [pwd '/figs/golden_section/iterations_l.png']);

figure("Name", "Number of calculations")
plot(ls, calculations(:, 1), ...
    ls, calculations(:, 2), ...
    ls, calculations(:, 3) ...
    );
xlabel("l");
ylabel("calculations");
legend("f1", "f2", "f3");
saveas(gcf, [pwd '/figs/golden_section/calculations_l.png']);

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
saveas(gcf, [pwd '/figs/golden_section/search_limits_0005.png']);

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
saveas(gcf, [pwd '/figs/golden_section/search_limits_001.png']);

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
saveas(gcf, [pwd '/figs/golden_section/search_limits_01.png']);

close all;