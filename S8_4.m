function H = S8_4(parameter)
% 20061205
% W. Bruzda, name[at]uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> H = S8_4(parameter)
% >> abs(H .* H'), norm(H * H' - 8 * eye(8), 'fro')

    try
        a = parameter(1, 1);
        b = parameter(1, 2);
        c = parameter(1, 3);
        d = parameter(1, 4);
    catch
        warning('No valid parameter provided! Continue with default zero value.');
        a = 0;
        b = 0;
        c = 0;
        d = 0;
    end

    S8 = [
        1,  1,  1,  1,  1,  1,  1,  1;
        1,  1, -1, -1, -1,  i, -i,  1;
        1,  i,  i, -i,  1, -1, -1, -i;
        1,  i, -i,  i, -1, -i,  i, -i;
        1, -1, -i,  i,  1,  i, -i, -1;
        1, -1,  i, -i, -1,  1,  1, -1;
        1, -i, -1, -1,  1, -i,  i,  i;
        1, -i,  1,  1, -1, -1, -1,  i;
    ];

    R_S8 = [
        0,       0,       0,       0, 0,       0,       0,       0;
        0,       d,       d,       d, 0, (c + d), (c + d),       d;
        0, (a - d), (b - d), (b - d), 0,       0,       0, (a - d);
        0,       a,       b,       b, 0, (c + d), (c + d),       a;
        0,       0, (b - d), (b - d), 0,       c,       c,       0;
        0,       d,       b,       b, 0,       d,       d,       d;
        0, (a - d),       0,       0, 0,       c,       c, (a - d);
        0,       a,       d,       d, 0,       d,       d,       a;
    ];

    H = S8 .* exp(2 * pi * i * R_S8);

end

