function compare_derivative_errors(t, y_n, coeffs_cell, omega, phi, dt, t_scaled, scale_factor)
% Compute L2 error of analytic polynomial derivatives vs true derivative

max_deg = length(coeffs_cell);
L2_poly = zeros(max_deg, 1);
L2_central = zeros(max_deg, 1);

% True derivative
y_true_derivative = omega * cos(omega * t + phi);

% Central difference (same for all)
delta_central = zeros(size(y_n));
delta_central(2: end - 1) = (y_n(3 : end) - y_n(1 : end - 2)) / (2 * dt);
delta_central(1) = (y_n(2) - y_n(1)) / dt;
delta_central(end) = (y_n(end) - y_n(end - 1)) / dt;
L2_central(:) = norm(delta_central - y_true_derivative) / length(t);

for m = 1:max_deg
    coeffs = coeffs_cell{m};
    p_deriv = polyder(coeffs);
    y_poly_derivative = polyval(p_deriv, t_scaled) / scale_factor;
    L2_poly(m) = norm(y_poly_derivative - y_true_derivative) /length(t);
end

% Plot L2 errors vs degree
figure;
semilogy(1 : max_deg, L2_poly, 'o-', 'LineWidth', 2, 'DisplayName', 'Polynomial derivative');
hold on;
semilogy(1 : max_deg, L2_central, 's--', 'LineWidth', 2, 'DisplayName', 'Central diff');
xlabel('Polynomial degree m');
ylabel('L2 error');
title('L2 error of derivative estimates vs polynomial degree');
legend('show','Location','best');
grid on;
saveas(gcf, 'poly-error.jpg');

[minErr, bestDeg] = min(L2_poly);
fprintf('Minimum L2 error from polynomial derivatives: %.3e (degree m=%d)\n', minErr, bestDeg);
fprintf('L2 error for central difference: %.3e\n', L2_central(1));

end
