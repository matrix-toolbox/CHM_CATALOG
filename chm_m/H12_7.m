% 20061205
% W. Bruzda, name[at]alumni.uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> H = H12_7(rand(1, 7))
% >> abs(H .* H'), norm(H * H' - 12 * eye(12), 'fro')

function H = H12_7(parameter)

    try
        a = parameter(1, 1);
        b = parameter(1, 2);
        c = parameter(1, 3);
        d = parameter(1, 4);
        e = parameter(1, 5);
        f = parameter(1, 6);
        g = parameter(1, 7);
    catch
        warning('No valid parameter provided! Continue with default zero value.');
        a = 0;
        b = 0;
        c = 0;
        d = 0;
        e = 0;
        f = 0;
        g = 0;
    end

    H12 = [
        1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1;
        1,  1,  1,  1,  1,  1, -1, -1, -1, -1, -1, -1;
        1, -1,  1,  1, -1, -1,  1,  1, -1,  1, -1, -1;
        1, -1,  1, -1,  1, -1, -1., 1,  1, -1,  1, -1;
        1, -1, -1,  1, -1,  1, -1,  1,  1, -1, -1,  1;
        1,  1,  1, -1, -1, -1,  1, -1,  1, -1, -1,  1;
        1,  1, -1, -1,  1, -1, -1,  1, -1,  1, -1,  1;
        1,  1, -1,  1, -1, -1, -1, -1,  1,  1,  1, -1;
        1, -1,  1, -1, -1,  1, -1, -1, -1,  1,  1,  1;
        1,  1, -1, -1, -1,  1,  1,  1, -1, -1,  1, -1;
        1, -1, -1, -1,  1,  1,  1, -1,  1,  1, -1, -1;
        1, -1, -1,  1,  1, -1,  1, -1, -1, -1,  1,  1;
    ];

    R_H12 = [
        0, 0,       0,       0,       0,       0,           0,           0,           0,           0,           0,           0;
        0, 0,       0,       0,       0,       0,           0,           0,           0,           0,           0,           0;
        0, 0,       a,       a,       a,       a,     (a + g),     (a + g), (a + e + g), (a + e + g),     (a + g),     (a + g);
        0, 0, (a + b), (a + b), (a + c), (a + c), (a + d + g), (a + d + g), (a + e + g), (a + e + g), (a + f + g), (a + f + g);
        0, 0, (a + b), (a + b), (a + c), (a + c), (a + d + g), (a + d + g), (a + e + g), (a + e + g), (a + f + g), (a + f + g);
        0, 0,       b,       b,       0,       0,     (d + g),     (d + g),     (e + g),     (e + g),     (f + g),     (f + g);
        0, 0,       0,       0,       c,       c,     (d + g),     (d + g),     (e + g),     (e + g),     (f + g),     (f + g);
        0, 0,       b,       b,       0,       0,           g,           g,           g,           g,     (f + g),     (f + g);
        0, 0, (a + b), (a + b), (a + c), (a + c),     (a + g),     (a + g), (a + e + g), (a + e + g),     (a + g),     (a + g);
        0, 0,       0,       0,       c,       c,           g,           g,           g,           g,     (f + g),     (f + g);
        0, 0,       a,       a,       a,       a, (a + d + g), (a + d + g),     (a + g),     (a + g),     (a + g),     (a + g);
        0, 0, (a + b), (a + b), (a + c), (a + c), (a + d + g), (a + d + g),     (a + g),     (a + g),     (a + g),     (a + g);
    ];

    H = H12 .* exp(2 * pi * i * R_H12);

end

