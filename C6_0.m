function H = C6_0
% 20061205
% W. Bruzda, name[at]uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> H = C6_0
% >> abs(H .* H'), norm(H * H' - 6 * eye(6), 'fro')

    d = (0.5 * (1 - sqrt(3))) + i * sqrt(0.5 * sqrt(3));

    H = [
        1,       1,       1,       1,       1,     1;
        1,      -1,      -d,    -d^2,     d^2,     d;
        1, -d^(-1),       1,     d^2,    -d^3,   d^2;
        1, -d^(-2),  d^(-2),      -1,     d^2,  -d^2;
        1,  d^(-2), -d^(-3),  d^(-2),       1,    -d;
        1,  d^(-1),  d^(-2), -d^(-2), -d^(-1),    -1;
    ];

end

