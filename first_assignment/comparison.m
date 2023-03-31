% run bicection method
bicection;

% hold caluclations
calculations_bicection = (iterations_variable_l_const_e(:, 1) - 1) * 2;

% run golden ratio method
golden_ratio;

% hold calculations
calculations_golden_ratio = calculations(:, 1);

% run golden ratio method
fibonacci_search;

% hold calculations
calculations_fibonacci = calculations(:, 1);

% run golden ratio method
bicection_with_derivative;

% hold calculations
calculations_bicection_derivative = calculations(:, 1);

% make the final plot
figure("Name", "Number of calculations")
plot(ls, calculations_bicection, ...
    ls, calculations_golden_ratio, ...
    ls, calculations_fibonacci, ...
    ls, calculations_bicection_derivative...
    );
xlabel("l");
ylabel("calculations");
legend("bicection", "golden ratio", "fibonacci", "bicection with derivative");
saveas(gcf, [pwd '/figs/comparison.png']);

close all;