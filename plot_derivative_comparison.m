function plot_derivative_comparison(t, coeffs, m, t_scaled, scale_factor, omega, phi)
% Plot the true derivative and the polynomial derivative for a chosen degree m

y_true_derivative = omega * cos(omega * t + phi);
p_derivative = polyder(coeffs);
y_poly_d = polyval(p_derivative, t_scaled) / scale_factor;

figure;
plot(t, y_true_derivative, 'k-', 'LineWidth', 2, 'DisplayName', 'True derivative');
hold on;
plot(t, y_poly_d, 'r--', 'LineWidth', 2, ...
    'DisplayName', sprintf('Polynomial derivative (m=%d)', m));
xlabel('t');
ylabel('y''(t)');
title(sprintf('True vs Polynomial Derivative (degree m=%d)', m));
legend('show','Location','best');
grid on;
saveas(gcf, 'poly-fit.jpg');

end