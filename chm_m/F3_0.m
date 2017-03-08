% 20061205
% W. Bruzda, name[at]alumni.uj.edu.pl | name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> H = F3_0
% >> abs(H .* H'), norm(H * H' - 3 * eye(3), 'fro')

function H = F3_0

    w = exp(2 * pi * i / 3);

    H = [
        1,   1,   1;
        1,   w, w^2;
        1, w^2,   w
    ];

end

