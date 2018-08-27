function H = S9_0
% 20160404
% W. Bruzda, name[at]uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> H = S9_0
% >> abs(H .* H'), norm(H * H' - 9 * eye(9), 'fro')

    w = exp(2 * pi * i / 3);

    H = [
        1,   1,   1,   1,   1,   1,    1,    1,    1;
        1,   w, w^2,   1,   w, w^2,  w^2,    1,    w;
        1, w^2,   w,   1, w^2,   w,  w^2,    w,    1;
        1,   1,   1,   w,   w,   w,  w^2,  w^2,  w^2;
        1,   w, w^2,   w, w^2,   1,    w,  w^2,    1;
        1, w^2,   w,   w,   1, w^2,    w,    1,  w^2;
        1,   w,   w, w^2,   1,   1,   -w,   -1,   -1;
        1, w^2,   1, w^2,   w, w^2, -w^2,   -1, -w^2;
        1,   1, w^2, w^2, w^2,   w, -w^2, -w^2,   -1;
    ];

end

