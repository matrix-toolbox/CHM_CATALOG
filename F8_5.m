function H = F8_5(parameter)
% 20061205
% W. Bruzda, name[at]uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> H = F8_5(rand(1, 5))
% >> abs(H .* H'), norm(H * H' - 8 * eye(8), 'fro')

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

    w = exp(2 * pi * i / 8);

    F8 = [
        1,   1,   1,   1,   1,   1,   1,   1;
        1,   w, w^2, w^3, w^4, w^5, w^6, w^7;
        1, w^2, w^4, w^6,   1, w^2, w^4, w^6;
        1, w^3, w^6,   w, w^4, w^7, w^2, w^5;
        1, w^4,   1, w^4,   1, w^4,   1, w^4;
        1, w^5, w^2, w^7, w^4,   w, w^6, w^3;
        1, w^6, w^4, w^2,   1, w^6, w^4, w^2;
        1, w^7, w^6, w^5, w^4, w^3, w^2, w^1;
    ];

    R_F8 = [
        0, 0, 0,           0, 0, 0, 0,           0;
        0, a, b,           c, 0, a, b,           c;
        0, d, 0,           d, 0, d, 0,           d;
        0, e, b, (c - a + e), 0, e, b, (c - a + e);
        0, 0, 0,           0, 0, 0, 0,           0;
        0, a, b,           c, 0, a, b,           c;
        0, d, 0,           d, 0, d, 0,           d;
        0, e, b, (c - a + e), 0, e, b, (c - a + e);
    ];

    H = F8 .* exp(2 * pi * i * R_F8);

end

