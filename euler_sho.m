function [t, y] = euler_sho(y0, v0, omega, h, T)
% Euler integration of the SHO

N = ceil(T / h);
t = linspace(0, T, N + 1);
y = zeros(1, N + 1);
v = zeros(1, N + 1);
y(1) = y0;
v(1) = v0;

for n = 1 : N
    y(n + 1) = y(n) + h * v(n);
    v(n + 1) = v(n) - h * (omega ^ 2) * y(n);
end

end