function H = S12_5(parameter)
% 20061205
% W. Bruzda, name[at]uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> H = S12_5(rand(1, 5))
% >> abs(H .* H'), norm(H * H' - 12 * eye(12), 'fro')

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

    S12 = [ % LOG-form
        0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0;
        0, 12, 24, 28,  4, 16,  0, 12, 24,  0, 12, 24;
        0, 24, 12, 20,  8, 32,  0, 24, 12,  0, 24, 12;
        0, 27,  0,  0,  0,  0, 18,  9, 18, 18, 18, 18;
        0,  3, 24, 28,  4, 16, 18, 21,  6, 18, 30,  6;
        0, 15, 12, 20,  8, 32, 18, 33, 30, 18,  6, 30;
        0,  0,  0, 18, 18, 18,  9,  0,  0, 27, 18, 18;
        0, 12, 24, 10, 22, 34,  9, 12, 24, 27, 30,  6;
        0, 24, 12,  2, 26, 14,  9, 24, 12, 27,  6, 30;
        0, 27,  0, 18, 18, 18, 27,  9, 18,  9,  0,  0;
        0,  3, 24, 10, 22, 34, 27, 21,  6,  9, 12, 24;
        0, 15, 12,  2, 26, 14, 27, 33, 30,  9, 24, 12;
    ];

    R_S12 = [
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
        0, 0, 0, a, a, a, 0, 0, 0, 0, 0, 0;
        0, 0, 0, b, b, b, 0, 0, 0, 0, 0, 0;
        0, d, e, 0, 0, 0, 0, d, e, 0, 0, 0;
        0, d, e, a, a, a, 0, d, e, 0, 0, 0;
        0, d, e, b, b, b, 0, d, e, 0, 0, 0;
        0, 0, 0, 0, 0, 0, c, 0, 0, c, 0, 0;
        0, 0, 0, a, a, a, c, 0, 0, c, 0, 0;
        0, 0, 0, b, b, b, c, 0, 0, c, 0, 0;
        0, d, e, 0, 0, 0, c, d, e, c, 0, 0;
        0, d, e, a, a, a, c, d, e, c, 0, 0;
        0, d, e, b, b, b, c, d, e, c, 0, 0;
    ];

    H = exp(S12 * 2 * pi * i / 36) .* exp(2 * pi * i * R_S12);

end

