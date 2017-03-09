% 20090822
% Bengt R. Karlsson
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> H = K6_2((2 * rand(1, 2) - 1) * pi / 2)
% >> abs(H .* H'), norm(H * H' - 6 * eye(6), 'fro')

function H = K6_2(parameter)

    get_x = @() (2 * rand - 1) * pi / 2;

    try
        x1 = mod(parameter(1, 1), 2 * pi); % modulo - normalize to [0, 2*pi)
        x2 = mod(parameter(1, 2), 2 * pi);

        if (x1 > pi / 2 && x1 <= 3 * pi / 2) || (x2 > pi / 2 && x2 <= 3 * pi / 2)
            warning('Parameters must be in (-pi/2, pi/2]. Continue with appropriate random value.');
            x1 = get_x();
            x2 = get_x();
        end
    catch
        warning('No valid parameter provided! Continue with appropriate random value.');
        x1 = get_x();
        x2 = get_x();
    end

    z1 = exp(i * x1);
    z2 = exp(i * x2);

    Z11 = 1 - (1 - z1) * (1 - z2) / 2;
    Z12 = z2 * (1 - (1 - z1) * (1 - 1 / z2) / 2);
    Z21 = z1 * z2 * conj(Z12);
    Z22 = - z1 * z2 * conj(Z11);

    a = zeros(2);
    a(1, 1) = - Z11 * (1 + 1i * sqrt(4 / Z11 / Z11' - 1)) / 2;
    a(1, 2) = - Z12 * (1 + 1i * sqrt(4 / Z12 / Z12' - 1)) / 2;
    a(2, 1) = - Z21 * (1 - 1i * sqrt(4 / Z21 / Z21' - 1)) / 2;
    a(2, 2) = - Z22 * (1 - 1i * sqrt(4 / Z22 / Z22' - 1)) / 2;
    b = - a - [Z11 Z12; Z21 Z22];

    H = [
        1,   1,       1,       1,       1,       1;
        1,  -1,      z1,     -z1,      z1,     -z1;
        1,  z2, a(1, 1), a(1, 2), b(1, 1), b(1, 2);
        1, -z2, a(2, 1), a(2, 2), b(2, 1), b(2, 2);
        1,  z2, b(1, 1), b(1, 2), a(1, 1), a(1, 2);
        1, -z2, b(2, 1), b(2, 2), a(2, 1), a(2, 2);
    ];

end

