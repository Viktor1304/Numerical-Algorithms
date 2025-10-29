function [coeffs_cell, cond_vals, t_scaled, scale_factor] = polynomial_fit(t, y_n, max_deg)
% Fit polynomials
% Args/Returns: t, y_n, max_deg -> coefficients and condition numbers.

% Center and scale t to [-1,1]
t_mean = mean(t);
t_range = (max(t) - min(t)) / 2;
t_scaled = (t - t_mean) / t_range;
scale_factor = t_range;

coeffs_cell = cell(max_deg, 1);
cond_vals = zeros(max_deg, 1);

for m = 1 : max_deg
    V = vander(t_scaled);
    V = V(:, end - m : end);
    coeffs = V \ y_n(:);
    coeffs_cell{m} = coeffs';
    cond_vals(m) = cond(V' * V);
end

end
