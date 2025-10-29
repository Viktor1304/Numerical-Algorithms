function partB(t, y_n, omega, phi, dt)
% Execute code for part B
% Args: t, y_n, omega, phi, dt

max_deg = 20;
chosen_deg = 11;

% Fit polynomials
[coeffs_cell, cond_vals, t_scaled, scale_factor] = polynomial_fit(t, y_n, max_deg);

% Plot cond(V'V)
plot_condition_number(cond_vals);

% Compute and plot L2 derivative errors
compare_derivative_errors(t, y_n, coeffs_cell, omega, phi, dt, t_scaled, scale_factor);

% Plot fits
plot_polynomial_fit(t, y_n, omega, phi, coeffs_cell, t_scaled);

% Plot true vs polynomial derivative for chosen degree
plot_derivative_comparison(t, coeffs_cell{chosen_deg}, chosen_deg, t_scaled, scale_factor, omega, phi);

end


