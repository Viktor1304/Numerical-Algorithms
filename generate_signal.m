function [t, y, y_n] = generate_signal(T, dt, omega, phi, sigma)
% generate sine with Gaussian noise
% Returns/Args: [t, y_true, y_noisy] = generate_signal(T, dt, omega, phi, sigma)

rng(1);

t = 0:dt:T;
y = sin(omega * t + phi);
y_n = y + sigma * randn(size(t));

end