function partC(omega, phi, T)
% Execute code for part C
% Args: omega, phi, T

h_values  = [0.2, 0.1, 0.05, 0.025, 0.0125, 0.00625];
y0 = sin(phi);
v0 = omega * cos(phi);

err_euler = zeros(size(h_values));
err_RK4 = zeros(size(h_values));

for i = 1 : length(h_values)
    % Ensure time is multiple of effective step
    h = h_values(i);
    N = round(T / h);
    h = T / N;
    h_values(i) = h;

    [tE, yE] = euler_sho(y0, v0, omega, h, T);

    [tR, yR] = rk4_sho(y0, v0, omega, h, T);

    y_true_E = sin(omega * tE + phi);
    y_true_R = sin(omega * tR + phi);

    err_euler(i) = max(abs(yE - y_true_E));
    err_RK4(i)   = max(abs(yR - y_true_R));
end

% Error Table
fprintf('\n%-10s %-15s %-15s\n',' h', 'Euler Error', 'RK4 Error');
fprintf('---------------------------------------------\n');
for i = 1 : length(h_values)
    fprintf('%-10.5f %-15.5e %-15.5e\n', h_values(i), err_euler(i), err_RK4(i));
end

figure;
loglog(h_values, err_euler, 'o-', 'LineWidth', 1.5, 'DisplayName', 'Euler');
hold on;
loglog(h_values, err_RK4, 's-', 'LineWidth', 1.5, 'DisplayName', 'RK4');
xlabel('Step size h');
ylabel('Global error  ||y - y_{true}||_{\infty}');
title('Global error vs step size for Euler and RK4');
grid on;
legend('show', 'Location', 'best');
saveas(gcf, 'euler-rk4.jpg');

end