function H = F15_8(parameter)
% 20061205
% W. Bruzda, name[at]uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> H = F15_8(rand(1, 8))
% >> abs(H .* H'), norm(H * H' - 15 * eye(15), 'fro')

    try
        a = parameter(1, 1);
        b = parameter(1, 2);
        c = parameter(1, 3);
        d = parameter(1, 4);
        e = parameter(1, 5);
        f = parameter(1, 6);
        g = parameter(1, 7);
        h = parameter(1, 8);
    catch
        warning('No valid parameter provided! Continue with default zero value.');
        a = 0;
        b = 0;
        c = 0;
        d = 0;
        e = 0;
        f = 0;
        g = 0;
        h = 0;
    end

    w = exp(2 * pi * i / 15);

    F15 = [
        1,    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,    1;
        1,    w,  w^2,  w^3,  w^4,  w^5,  w^6,  w^7,  w^8,  w^9, w^10, w^11, w^12, w^13, w^14;
        1,  w^2,  w^4,  w^6,  w^8, w^10, w^12, w^14,    w,  w^3,  w^5,  w^7,  w^9, w^11, w^13;
        1,  w^3,  w^6,  w^9, w^12,    1,  w^3,  w^6,  w^9, w^12,    1,  w^3,  w^6,  w^9, w^12;
        1,  w^4,  w^8, w^12,    w,  w^5,  w^9, w^13,  w^2,  w^6, w^10, w^14,  w^3,  w^7, w^11;
        1,  w^5, w^10,    1,  w^5, w^10,    1,  w^5, w^10,    1,  w^5, w^10,    1,  w^5, w^10;
        1,  w^6, w^12,  w^3,  w^9,    1,  w^6, w^12,  w^3,  w^9,    1,  w^6, w^12,  w^3,  w^9;
        1,  w^7, w^14,  w^6, w^13,  w^5, w^12,  w^4, w^11,  w^3, w^10,  w^2,  w^9,    w,  w^8;
        1,  w^8,    w,  w^9,  w^2, w^10,  w^3, w^11,  w^4, w^12,  w^5, w^13,  w^6, w^14,  w^7;
        1,  w^9,  w^3, w^12,  w^6,    1,  w^9,  w^3, w^12,  w^6,    1,  w^9,  w^3, w^12,  w^6;
        1, w^10,  w^5,    1, w^10,  w^5,    1, w^10,  w^5,    1, w^10,  w^5,    1, w^10,  w^5;
        1, w^11,  w^7,  w^3, w^14, w^10,  w^6,  w^2, w^13,  w^9,  w^5,    w, w^12,  w^8,  w^4;
        1, w^12,  w^9,  w^6,  w^3,    1, w^12,  w^9,  w^6,  w^3,    1, w^12,  w^9,  w^6,  w^3;
        1, w^13, w^11,  w^9,  w^7,  w^5,  w^3,    w, w^14, w^12, w^10,  w^8,  w^6,  w^4,  w^2;
        1, w^14, w^13, w^12, w^11, w^10,  w^9,  w^8,  w^7,  w^6,  w^5,  w^4,  w^3,  w^2,    w;
    ];

    R_F15 = [
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
        0, a, b, c, d, 0, a, b, c, d, 0, a, b, c, d;
        0, e, f, g, h, 0, e, f, g, h, 0, e, f, g, h;
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
        0, a, b, c, d, 0, a, b, c, d, 0, a, b, c, d;
        0, e, f, g, h, 0, e, f, g, h, 0, e, f, g, h;
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
        0, a, b, c, d, 0, a, b, c, d, 0, a, b, c, d;
        0, e, f, g, h, 0, e, f, g, h, 0, e, f, g, h;
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
        0, a, b, c, d, 0, a, b, c, d, 0, a, b, c, d;
        0, e, f, g, h, 0, e, f, g, h, 0, e, f, g, h;
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
        0, a, b, c, d, 0, a, b, c, d, 0, a, b, c, d;
        0, e, f, g, h, 0, e, f, g, h, 0, e, f, g, h;
    ];

    H = F15 .* exp(2 * pi * i * R_F15);

end

