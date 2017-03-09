% 20061205
% W. Bruzda, name[at]alumni.uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> H = N9_0
% >> abs(H .* H'), norm(H * H' - 9 * eye(9), 'fro')

function H = N9_0

    y = (1 - i * sqrt(15)) / 4;

    H = [
        1,    1,    1,    1,      1,       1,       1,    1,      1;
        1,   -1,   -1,    y, y^(-1), -y^(-3),  y^(-3),    y, y^(-1);
        1,    y,  y^3, -y^2,    y^3,       y,      -1,   -y,      y;
        1,    y,    y,   -1, y^(-1),  y^(-3), -y^(-3),   -1, y^(-1);
        1,   -y, -y^2,  y^3,    y^3,      -1,       y,    y,      y;
        1,    y,  y^3,  y^3,      y,  y^(-1),  y^(-1),    y,    y^2;
        1,  y^3,    y,    y,    y^2,  y^(-1),  y^(-1),  y^3,      y;
        1, -y^2,   -y,    y,      y,      -1,       y,  y^3,    y^3;
        1,  y^3,    y,   -y,      y,       y,      -1, -y^2,    y^3;
    ];

end

