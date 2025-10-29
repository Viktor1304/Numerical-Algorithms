function plot_generated_noisy_signals(t, y_n, omega, phi)
% Plot true vs noisy generated signal

y_true = sin(omega * t + phi);
figure;
plot(t, y_true, 'k-', 'LineWidth', 1.3, 'DisplayName', 'True signal');
hold on;
plot(t, y_n, '.', 'Color', [0.6 0.6 0.6], 'DisplayName', 'Noisy samples');
xlabel('t');
ylabel('y(t)');
title('Generated True Signal and Noisy Observations');
legend('show', 'Location', 'best');
grid on;

end