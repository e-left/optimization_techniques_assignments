% clear;

% steepest_descend;
% 
% levenberg_marquardt;

% aggregated plot

% number of iterations, different methods different starting points
% differrent step calculations

figure("Name", "Iterations per starting point");

x = categorical({'(0, 0)','(-1, 1)','(1, -1'});
x = reordercats(x, {'(0, 0)','(-1, 1)','(1, -1'});
y = [ ...
    sd_const_step_zero_iter(1) sd_const_step_one_iter(1) sd_const_step_two_iter(1) ;...
    lm_const_step_zero_iter(1) lm_const_step_one_iter(1) lm_const_step_two_iter(1) ;...
    sd_min_step_zero_iter(1) sd_min_step_one_iter(1) sd_min_step_two_iter(1) ;...
    lm_min_step_zero_iter(1) lm_min_step_one_iter(1) lm_min_step_two_iter(1) ;...
    sd_arm_step_zero_iter(1) sd_arm_step_one_iter(1) sd_arm_step_two_iter(1);...
    lm_arm_step_zero_iter(1) lm_arm_step_one_iter(1) lm_arm_step_two_iter(1);...
    ];
bar(x, y);
legend("Steepest descend, constant step = 0.5", "Levenberg-Marquardt, constant step = 0.5", ...
    "Steepest descend, minimizing step = 0.5", "Levenberg-Marquardt, minimizing step = 0.5", ...
    "Steepest descend, armijo's rule step = 0.5", "Levenberg-Marquardt, armijo's rule step = 0.5");
ylabel("iterations");
saveas(gcf, [pwd '/figs/all_iterations.png']);