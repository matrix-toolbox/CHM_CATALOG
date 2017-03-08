% 20061205
% W. Bruzda, name[at]alumni.uj.edu.pl | name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> H = B9
% >> abs(H .* H'), norm(H * H' - 9 * eye(9), 'fro')

function H = B9

    e = exp(2 * pi * i / 10);

    H = [
        1,   1,   1,   1,   1,   1,   1,   1,   1;
        1,  -1, e^3, e^3,  -1, e^9, e^8, e^7,   e;
        1, e^4,  -1, e^7,   e, e^3,  -1, e^9, e^9;
        1, e^3, e^7,  -1,   e, e^8, e^9, e^3,  -1;
        1, e^9,   e,  -1,  -1, e^3, e^7, e^2, e^7;
        1, e^9,  -1,   e, e^3,  -1,   e, e^7, e^6;
        1,   e, e^7, e^9, e^6,   e,  -1,  -1, e^3;
        1, e^7, e^9, e^4, e^9,  -1, e^3,  -1,   e;
        1,  -1, e^2, e^9, e^7, e^7, e^3,   e,  -1;
    ];

end

