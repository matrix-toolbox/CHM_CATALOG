function H = F9_4(parameter)
% 20061205
% W. Bruzda, name[at]uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> H = F9_4(rand(1, 4))
% >> abs(H .* H'), norm(H * H' - 9 * eye(9), 'fro')

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

    w = exp(2 * pi * i / 9);

    F9 = [
        1,   1,   1,   1,   1,   1,   1,   1,   1;
        1,   w, w^2, w^3, w^4, w^5, w^6, w^7, w^8;
        1, w^2, w^4, w^6, w^8,   w, w^3, w^5, w^7;
        1, w^3, w^6,   1, w^3, w^6,   1, w^3, w^6;
        1, w^4, w^8, w^3, w^7, w^2, w^6,   w, w^5;
        1, w^5,   w, w^6, w^2, w^7, w^3, w^8, w^4;
        1, w^6, w^3,   1, w^6, w^3,   1, w^6, w^3;
        1, w^7, w^5, w^3,   w, w^8, w^6, w^4, w^2;
        1, w^8, w^7, w^6, w^5, w^4, w^3, w^2,   w;
    ];

    R_F9 = [
        0, 0, 0, 0, 0, 0, 0, 0, 0;
        0, a, b, 0, a, b, 0, a, b;
        0, c, d, 0, c, d, 0, c, d;
        0, 0, 0, 0, 0, 0, 0, 0, 0;
        0, a, b, 0, a, b, 0, a, b;
        0, c, d, 0, c, d, 0, c, d;
        0, 0, 0, 0, 0, 0, 0, 0, 0;
        0, a, b, 0, a, b, 0, a, b;
        0, c, d, 0, c, d, 0, c, d;
    ];

    H = F9 .* exp(2 * pi * i * R_F9);

end

