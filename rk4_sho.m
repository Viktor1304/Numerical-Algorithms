function [t, y] = rk4_sho(y0, v0, omega, h, T)
% RK4 integration of the SHO

N = ceil(T / h);
t = linspace(0, T, N + 1);
y = zeros(1, N + 1);
v = zeros(1, N + 1);
y(1) = y0;
v(1) = v0;

for n = 1 : N
    yn = y(n);
    vn = v(n);

    f1 = vn;
    g1 = -omega ^ 2 * yn;

    f2 = vn + 0.5 * h * g1;
    g2 = -omega ^ 2 * (yn + 0.5 * h * f1);

    f3 = vn + 0.5 * h * g2;
    g3 = -omega ^ 2 * (yn + 0.5 * h * f2);

    f4 = vn + h * g3;
    g4 = -omega ^ 2 * (yn + h * f3);

    y(n + 1) = yn + (h / 6) * (f1 + 2 * f2 + 2 * f3 + f4);
    v(n + 1) = vn + (h / 6) * (g1 + 2 * g2 + 2 * g3 + g4);
end

end