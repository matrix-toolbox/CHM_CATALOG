function H = D6_1(parameter)
% 20061205
% W. Bruzda, name[at]uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> H = D6_1(rand(1, 1))
% >> abs(H .* H'), norm(H * H' - 6 * eye(6), 'fro')

    try
        p = parameter(1, 1);
    catch
        warning('No valid parameter provided! Continue with default zero value.');
        p = 0;
    end

    D6 = [
        1,  1,  1,  1,  1,  1;
        1, -1,  i, -i, -i,  i;
        1,  i, -1,  i, -i, -i;
        1, -i,  i, -1,  i, -i;
        1, -i, -i,  i, -1,  i;
        1,  i, -i, -i,  i, -1;
    ];

    R_D6 = [
        0,  0,  0,  0,  0,  0;
        0,  0,  0,  0,  0,  0;
        0,  0,  0,  p,  p,  0;
        0,  0, -p,  0,  0, -p;
        0,  0, -p,  0,  0, -p;
        0,  0,  0,  p,  p,  0;
    ];

    H = D6 .* exp(2 * pi * i * R_D6);

end

