function H = F3_0
% 20061205
% W. Bruzda, name[at]uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> H = F3_0
% >> abs(H .* H'), norm(H * H' - 3 * eye(3), 'fro')

    w = exp(2 * pi * i / 3);

    H = [
        1,   1,   1;
        1,   w, w^2;
        1, w^2,   w
    ];

end

