% 20061205
% W. Bruzda, name[at]alumni.uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> H = F14_6(rand(1, 6))
% >> abs(H .* H'), norm(H * H' - 14 * eye(14), 'fro')

function H = F14_6(parameter)

    try
        a = parameter(1, 1);
        b = parameter(1, 2);
        c = parameter(1, 3);
        d = parameter(1, 4);
        e = parameter(1, 5);
        f = parameter(1, 6);
    catch
        warning('No valid parameter provided! Continue with default zero value.');
        a = 0;
        b = 0;
        c = 0;
        d = 0;
        e = 0;
        f = 0;
    end

    w = exp(2 * pi * i / 14);

    F14 = [
        1,    1,    1,    1,    1,    1,    1,   1,    1,    1,    1,    1,    1,    1;
        1,    w,  w^2,  w^3,  w^4,  w^5,  w^6, w^7,  w^8,  w^9, w^10, w^11, w^12, w^13;
        1,  w^2,  w^4,  w^6,  w^8, w^10, w^12,   1,  w^2,  w^4,  w^6,  w^8, w^10, w^12;
        1,  w^3,  w^6,  w^9, w^12,    w,  w^4, w^7, w^10, w^13,  w^2,  w^5,  w^8, w^11;
        1,  w^4,  w^8, w^12,  w^2,  w^6, w^10,   1,  w^4,  w^8, w^12,  w^2,  w^6, w^10;
        1,  w^5, w^10,    w,  w^6, w^11,  w^2, w^7, w^12,  w^3,  w^8, w^13,  w^4,  w^9;
        1,  w^6, w^12,  w^4, w^10,  w^2,  w^8,   1,  w^6, w^12,  w^4, w^10,  w^2,  w^8;
        1,  w^7,    1,  w^7,    1,  w^7,    1, w^7,    1,  w^7,    1,  w^7,    1,  w^7;
        1,  w^8,  w^2, w^10,  w^4, w^12,  w^6,   1,  w^8,  w^2, w^10,  w^4, w^12,  w^6;
        1,  w^9,  w^4, w^13,  w^8,  w^3, w^12, w^7,  w^2, w^11,  w^6,    w, w^10,  w^5;
        1, w^10,  w^6,  w^2, w^12,  w^8,  w^4,   1, w^10,  w^6,  w^2, w^12,  w^8,  w^4;
        1, w^11,  w^8,  w^5,  w^2, w^13, w^10, w^7,  w^4,    w, w^12,  w^9,  w^6,  w^3;
        1, w^12, w^10,  w^8,  w^6,  w^4,  w^2,   1, w^12, w^10,  w^8,  w^6,  w^4,  w^2;
        1, w^13, w^12, w^11, w^10,  w^9,  w^8, w^7,  w^6,  w^5,  w^4,  w^3,  w^2,    w;
    ];

    R_F14 = [
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
        0, a, b, c, d, e, f, 0, a, b, c, d, e, f;
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
        0, a, b, c, d, e, f, 0, a, b, c, d, e, f;
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
        0, a, b, c, d, e, f, 0, a, b, c, d, e, f;
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
        0, a, b, c, d, e, f, 0, a, b, c, d, e, f;
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
        0, a, b, c, d, e, f, 0, a, b, c, d, e, f;
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
        0, a, b, c, d, e, f, 0, a, b, c, d, e, f;
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
        0, a, b, c, d, e, f, 0, a, b, c, d, e, f;
    ];

    H = F14 .* exp(2 * pi * i * R_F14);

end

