% 20061205
% W. Bruzda, name[at]alumni.uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> H = F4_1(rand(1, 1))
% >> abs(H .* H'), norm(H * H' - 4 * eye(4), 'fro')

function H = F4_1(parameter)

    try
        a = parameter(1, 1);
    catch
        warning('No valid parameter provided! Continue with default zero value.');
        a = 0;
    end

    w = exp(2 * pi * i / 4);

    F4 = [
        1,   1,   1,   1;
        1, w^1, w^2, w^3;
        1, w^2,   1, w^2;
        1, w^3, w^2, w^1;
    ];

    R_F4 = [
        0, 0, 0, 0;
        0, a, 0, a;
        0, 0, 0, 0;
        0, a, 0, a;
    ];

    H = F4 .* exp(2 * pi * i * R_F4);
end

