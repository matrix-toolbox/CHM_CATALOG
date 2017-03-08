% 20061205
% W. Bruzda, name[at]alumni.uj.edu.pl | name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> H = P7_1(rand(1, 1))
% >> abs(H .* H'), norm(H * H' - 7 * eye(7), 'fro')

function H = P7_1(parameter)

    try
        a = parameter(1, 1);
    catch
        warning('No valid parameter provided! Continue with default zero value.');
        a = 0;
    end

    w = exp(2 * pi * i / 6);

    P7 = [
        1,   1,   1,   1,   1,   1,   1;
        1, w^1, w^4, w^5, w^3, w^3, w^1;
        1, w^4, w^1, w^3, w^5, w^3, w^1;
        1, w^5, w^3, w^1, w^4, w^1, w^3;
        1, w^3, w^5, w^4, w^1, w^1, w^3;
        1, w^3, w^3, w^1, w^1, w^4, w^5;
        1, w^1, w^1, w^3, w^3, w^5, w^4;
    ];

    R_P7 = [
        0, 0, 0,  0,  0, 0, 0;
        0, a, a,  0,  0, 0, 0;
        0, a, a,  0,  0, 0, 0;
        0, 0, 0, -a, -a, 0, 0;
        0, 0, 0, -a, -a, 0, 0;
        0, 0, 0,  0,  0, 0, 0;
        0, 0, 0,  0,  0, 0, 0;
    ];

    H = P7 .* exp(2 * pi * i * R_P7);

end

