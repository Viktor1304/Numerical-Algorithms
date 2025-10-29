function plot_polynomial_fit(t, y_n, omega, phi, coeffs_cell, t_scaled)
% Plot polynomial fits vs noisy and true signal

y_true = sin(omega * t + phi);

for m = 1 : 2 : length(coeffs_cell)
    coeffs = coeffs_cell{m};
    y_poly = polyval(coeffs, t_scaled);

    figure("Visible", "off");
    plot(t, y_n, '.', 'Color', [0.6 0.6 0.6], 'DisplayName', 'Noisy data');
    hold on;
    plot(t, y_true, 'k-', 'LineWidth', 1.2, 'DisplayName', 'True signal');
    plot(t, y_poly, '-', 'LineWidth', 1.5, 'DisplayName', sprintf('Poly fit m=%d',m));
    xlabel('t');
    ylabel('y(t)');
    title(sprintf('Polynomial fit (degree m=%d)', m));
    legend('show');
    grid on;
end

end