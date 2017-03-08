% 20061205
% W. Bruzda, name[at]alumni.uj.edu.pl | name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> H = F10_4(rand(1, 4))
% >> abs(H .* H'), norm(H * H' - 10 * eye(10), 'fro')

function H = F10_4(parameter)

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

    w = exp(2 * pi * i / 10);

    F10 = [
        1,   1,   1,   1,   1,   1,   1,   1,   1,   1;
        1,   w, w^2, w^3, w^4, w^5, w^6, w^7, w^8, w^9;
        1, w^2, w^4, w^6, w^8,   1, w^2, w^4, w^6, w^8;
        1, w^3, w^6, w^9, w^2, w^5, w^8,   w, w^4, w^7;
        1, w^4, w^8, w^2, w^6,   1, w^4, w^8, w^2, w^6;
        1, w^5,   1, w^5,   1, w^5,   1, w^5,   1, w^5;
        1, w^6, w^2, w^8, w^4,   1, w^6, w^2, w^8, w^4;
        1, w^7, w^4,   w, w^8, w^5, w^2, w^9, w^6, w^3;
        1, w^8, w^6, w^4, w^2,   1, w^8, w^6, w^4, w^2;
        1, w^9, w^8, w^7, w^6, w^5, w^4, w^3, w^2,   w;
    ];

    R_F10 = [
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
        0, a, b, c, d, 0, a, b, c, d;
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
        0, a, b, c, d, 0, a, b, c, d;
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
        0, a, b, c, d, 0, a, b, c, d;
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
        0, a, b, c, d, 0, a, b, c, d;
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
        0, a, b, c, d, 0, a, b, c, d;
    ];

    H = F10 .* exp(2 * pi * i * R_F10);

end

