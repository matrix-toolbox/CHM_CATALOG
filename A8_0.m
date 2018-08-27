function H = A8_0
% 20160531
% W. Bruzda, name[at]uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> H = A8_0
% >> abs(H .* H'), norm(H * H' - 8 * eye(8), 'fro')

    a = 1 / 3 + i * sqrt(8) / 3;

    H = [
        1,    1,    1,    1,    1,    1,    1,    1;
        1, -a^2,   -1,  a^2,    a,   -a,   -a,    a;
        1,   -1,   -1,   -a,  1/a,    1, -1/a,    a;
        1,  a^2,   -a,    a,   -1,    a,   -a, -a^2;
        1,    a,  1/a,   -1,    1,   -1, -1/a,   -a;
        1,   -a,    1,    a,   -1,  1/a, -1/a,   -1;
        1,   -a, -1/a,   -a, -1/a, -1/a,    1,   -a;
        1,    a,    a, -a^2,   -a,   -1,   -a,  a^2;
    ];

end

