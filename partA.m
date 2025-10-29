function partA(t, y_n, omega, phi, dt)
% Execute code for part A
% Args: t, y_n, omega, phi, dt

k_values = [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024];

[effective_step, err_forward, err_backward, err_central] = finite_difference(t, y_n, omega, phi, dt, k_values);

figure;
loglog(effective_step, err_forward, 's-', effective_step, err_backward, 'o-', effective_step, err_central, 'd-');
xlabel('Effective step h');
ylabel('Normalised L2 Error');
legend('Forward', 'Backward', 'Central');
grid on;
saveas(gcf, 'l2diff.jpg');

end