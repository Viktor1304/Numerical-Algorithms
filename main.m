% main.m - Code with all tasks (A-C)
% MATLAB version: R2023b
% Author: Viktor Mihaylov, University College
clc;

% reproducible noise
rng(1);

% Parameters
T = 2 * pi;
dt = 0.001;
omega = 2.0;
phi = pi / 6;
sigma = 0.01;

% Generate signal used in all parts
[t, y, y_n] = generate_signal(T, dt, omega, phi, sigma);

plot_generated_noisy_signals(t, y_n, omega, phi);

partA(t, y_n, omega, phi, dt);

partB(t, y_n, omega, phi, dt);

partC(omega, phi, T);
