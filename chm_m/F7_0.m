% 20061205
% W. Bruzda, name[at]alumni.uj.edu.pl | name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> H = F7_0
% >> abs(H .* H'), norm(H * H' - 7 * eye(7), 'fro')

function H = F7_0

    w = exp(2 * pi * i / 7);

    H = [
        1,   1,   1,   1,   1,   1,   1;
        1,   w, w^2, w^3, w^4, w^5, w^6;
        1, w^2, w^4, w^6,   w, w^3, w^5;
        1, w^3, w^6, w^2, w^5,   w, w^4;
        1, w^4,   w, w^5, w^2, w^6, w^3;
        1, w^5, w^3,   w, w^6, w^4, w^2;
        1, w^6, w^5, w^4, w^3, w^2,   w;
    ];

end

