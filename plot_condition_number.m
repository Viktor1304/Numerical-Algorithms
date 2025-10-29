function plot_condition_number(cond_vals)
% Plot condition number vs polynomial degree

figure;
semilogy(1 : length(cond_vals), cond_vals, 'o-', 'LineWidth', 1.5);
xlabel('Polynomial degree m');
ylabel('cond(V''V)');
title('Condition number vs polynomial degree');
grid on;
saveas(gcf, 'cond.jpg');

end