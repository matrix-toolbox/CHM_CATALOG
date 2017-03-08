% 20061205
% W. Bruzda, name[at]alumni.uj.edu.pl | name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> H = F6_2(rand(1, 2))
% >> abs(H .* H'),  norm(H * H' - 6 * eye(6), 'fro')

function H = F6_2(parameter)

    try
        a = parameter(1, 1);
        b = parameter(1, 2);
    catch
        warning('No valid parameter provided! Continue with default zero value.');
        a = 0;
        b = 0;
    end

    w = exp(2 * pi * i / 6);

    F6 = [
        1,   1,   1,  1,   1,   1;
        1, w^1, w^2, -1, w^4, w^5;
        1, w^2, w^4,  1, w^2, w^4;
        1,  -1,   1, -1,   1,  -1;
        1, w^4, w^2,  1, w^4, w^2;
        1, w^5, w^4, -1, w^2, w^1;
    ];

    R_F6 = [
        0, 0, 0, 0, 0, 0;
        0, a, b, 0, a, b;
        0, 0, 0, 0, 0, 0;
        0, a, b, 0, a, b;
        0, 0, 0, 0, 0, 0;
        0, a, b, 0, a, b;
    ];
    
    H = F6 .* exp(2 * pi * i * R_F6);

end

