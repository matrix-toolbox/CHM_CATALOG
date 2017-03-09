% 20061205
% W. Bruzda, name[at]alumni.uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> H = D14_5(rand(1, 5))
% >> abs(H .* H'), norm(H * H' - 14 * eye(14), 'fro')

function H = D14_5(parameter)

    try
        a = parameter(1, 1);
        b = parameter(1, 2);
        c = parameter(1, 3);
        d = parameter(1, 4);
        e = parameter(1, 5);
    catch
        warning('No valid parameter provided! Continue with default zero value.');
        a = 0;
        b = 0;
        c = 0;
        d = 0;
        e = 0;
    end

    D14 = [
        1, +1, +1, +1, +1, +1, +1, +1, +1, +1, +1, +1, +1, +1;
        1, -1, +i, -i, +i, +i, -i, -i, -i, -i, +i, +i, -i, +i;
        1, +i, -1, +i, -i, +i, +i, -i, -i, -i, -i, +i, +i, -i;
        1, -i, +i, -1, +i, -i, +i, +i, -i, -i, -i, -i, +i, +i;
        1, +i, -i, +i, -1, +i, -i, +i, +i, -i, -i, -i, -i, +i;
        1, +i, +i, -i, +i, -1, +i, -i, +i, +i, -i, -i, -i, -i;
        1, -i, +i, +i, -i, +i, -1, +i, -i, +i, +i, -i, -i, -i;
        1, -i, -i, +i, +i, -i, +i, -1, +i, -i, +i, +i, -i, -i;
        1, -i, -i, -i, +i, +i, -i, +i, -1, +i, -i, +i, +i, -i;
        1, -i, -i, -i, -i, +i, +i, -i, +i, -1, +i, -i, +i, +i;
        1, +i, -i, -i, -i, -i, +i, +i, -i, +i, -1, +i, -i, +i;
        1, +i, +i, -i, -i, -i, -i, +i, +i, -i, +i, -1, +i, -i;
        1, -i, +i, +i, -i, -i, -i, -i, +i, +i, -i, +i, -1, +i;
        1, +i, -i, +i, +i, -i, -i, -i, -i, +i, +i, -i, +i, -1;
    ];

    R_D14 = [
        0,  0,       0,       0,       0,       0,       0, 0,       0,       0,       0,       0,       0,  0;
        0,  0,       a,       b,       0,       c,       0, 0,       0,       c,       0,       b,       a,  0;
        0, -a,       0,       0,       0, (c - a), (e - a), 0, (e - a), (c - a),       0,       0,       0, -a;
        0, -b,       0,       0, (d - b),       0, (e - b), 0, (e - b),       0, (d - b),       0,       0, -b;
        0,  0,       0, (b - d),       0, (c - d), (e - d), 0, (e - d), (c - d),       0, (b - d),       0,  0;
        0, -c, (a - c),       0, (d - c),       0,       0, 0,       0,       0, (d - c),       0, (a - c), -c;
        0,  0, (a - e), (b - e), (d - e),       0,       0, 0,       0,       0, (d - e), (b - e), (a - e),  0;
        0,  0,       0,       0,       0,       0,       0, 0,       0,       0,       0,       0,       0,  0;
        0,  0, (a - e), (b - e), (d - e),       0,       0, 0,       0,       0, (d - e), (b - e), (a - e),  0;
        0, -c, (a - c),       0, (d - c),       0,       0, 0,       0,       0, (d - c),       0, (a - c), -c;
        0,  0,       0, (b - d),       0, (c - d), (e - d), 0, (e - d), (c - d),       0, (b - d),       0,  0;
        0, -b,       0,       0, (d - b),       0, (e - b), 0, (e - b),       0, (d - b),       0,       0, -b;
        0, -a,       0,       0,       0, (c - a), (e - a), 0, (e - a), (c - a),       0,       0,       0, -a;
        0,  0,       a,       b,       0,       c,       0, 0,       0,       c,       0,       b,       a,  0;
    ];

    H = D14 .* exp(2 * pi * i * R_D14);

end

