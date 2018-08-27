function H = F13_0
% 20061205
% W. Bruzda, name[at]uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> H = F13_0
% >> abs(H .* H'), norm(H * H' - 13 * eye(13), 'fro')

    w = exp(2 * pi * i / 13);

    H = [
        1,    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,    1;
        1,    w,  w^2,  w^3,  w^4,  w^5,  w^6,  w^7,  w^8,  w^9, w^10, w^11, w^12;
        1,  w^2,  w^4,  w^6,  w^8, w^10, w^12,    w,  w^3,  w^5,  w^7,  w^9, w^11;
        1,  w^3,  w^6,  w^9, w^12,  w^2,  w^5,  w^8, w^11,    w,  w^4,  w^7, w^10;
        1,  w^4,  w^8, w^12,  w^3,  w^7, w^11,  w^2,  w^6, w^10,    w,  w^5,  w^9;
        1,  w^5, w^10,  w^2,  w^7, w^12,  w^4,  w^9,    w,  w^6, w^11,  w^3,  w^8;
        1,  w^6, w^12,  w^5, w^11,  w^4, w^10,  w^3,  w^9,  w^2,  w^8,    w,  w^7;
        1,  w^7,    w,  w^8,  w^2,  w^9,  w^3, w^10,  w^4, w^11,  w^5, w^12,  w^6;
        1,  w^8,  w^3, w^11,  w^6,    w,  w^9,  w^4, w^12,  w^7,  w^2, w^10,  w^5;
        1,  w^9,  w^5,    w, w^10,  w^6,  w^2, w^11,  w^7,  w^3, w^12,  w^8,  w^4;
        1, w^10,  w^7,  w^4,    w, w^11,  w^8,  w^5,  w^2, w^12,  w^9,  w^6,  w^3;
        1, w^11,  w^9,  w^7,  w^5,  w^3,    w, w^12, w^10,  w^8,  w^6,  w^4,  w^2;
        1, w^12, w^11, w^10,  w^9,  w^8,  w^7,  w^6,  w^5,  w^4,  w^3,  w^2,    w;
    ];

end

