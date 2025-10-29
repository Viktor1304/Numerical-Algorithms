function [effective_step, err_forward, err_backward, err_central] = finite_difference(t, y_n, omega, phi, dt, k_values)
% compute L2 errors for forward/backward/central differences
% Returns/Args: [effective_step, err_forward, err_backward, err_central] = 
%                                   finite_difference(t, y_n, omega, phi, dt, k_values)

effective_step = k_values * dt;
err_forward = zeros(size(k_values));
err_backward = zeros(size(k_values));
err_central = zeros(size(k_values));

for i = 1:length(k_values)
    k = k_values(i);
    h = effective_step(i);

    idx = 1:k:length(t);
    % Time values for each k
    curr_time = t(idx);
    curr_y = y_n(idx);

    % forward difference
    delta_forward = (curr_y(2:end) - curr_y(1:end - 1)) / h;
    time_forward = curr_time(1:end - 1);
    y_forward = omega * cos(omega * time_forward + phi);
    % Normalise by the number of time steps
    % This ensures that we are comparing the same quantity at the end
    err_forward(i) = norm(delta_forward - y_forward) / length(time_forward);

    % backward difference
    delta_backward = (curr_y(2:end) - curr_y(1:end - 1)) / h;
    time_backward = curr_time(2:end);
    y_backward = omega * cos(omega * time_backward + phi);
    err_backward(i) = norm(delta_backward - y_backward) / length(time_backward);

    % central difference
    delta_central = (curr_y(3:end) - curr_y(1:end - 2)) / (2 * h);
    time_central = curr_time(2:end - 1);
    y_central = omega * cos(omega * time_central + phi);
    err_central(i) = norm(delta_central - y_central) / length(time_central);

end

end