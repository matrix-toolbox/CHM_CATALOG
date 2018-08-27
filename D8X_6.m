function H = D8X_6(SIGMA, parameter)
% 20160612
% W. Bruzda, name[at]uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> SIGMA = 1 % or 2
% >> H = D8X_6(SIGMA, rand(1, 6))
% >> abs(H .* H'), norm(H * H' - 8 * eye(8), 'fro')

    try
        a = parameter(1, 1);
        b = parameter(1, 2);
        c = parameter(1, 3);
        d = parameter(1, 4);
        e = parameter(1, 5);
        f = parameter(1, 6);
    catch
        warning('No valid parameter provided! Continue with default zero value.');
        a = 0;
        b = 0;
        c = 0;
        d = 0;
        e = 0;
        f = 0;
    end

    if (SIGMA == 1)
        D8 = [
            1,  1,  1,  1,  1,  1,  1,  1;
            1,  1, -1,  1, -1, -1,  1, -1;
            1,  1,  1, -1, -1, -1, -1,  1;
            1, -1,  1,  1, -1,  1, -1, -1;
            1, -1,  1, -1,  1, -1,  1, -1;
            1, -1, -1,  1,  1, -1, -1,  1;
            1,  1, -1, -1,  1,  1, -1, -1;
            1, -1, -1, -1, -1,  1,  1,  1;
        ];
    elseif (SIGMA == 2)
        D8 = [
            1,  1,  1,  1,  1,  1,  1,  1;
            1,  1,  1, -1, -1, -1, -1,  1;
            1, -1,  1,  1, -1,  1, -1, -1;
            1,  1, -1,  1, -1, -1,  1, -1;
            1,  1, -1, -1,  1,  1, -1, -1;
            1, -1,  1, -1,  1, -1,  1, -1;
            1, -1, -1,  1,  1, -1, -1,  1;
            1, -1, -1, -1, -1,  1,  1,  1;
        ];
    else
        error('Invalid SIGMA value! SIGMA = 1 or 2.');
    end

    R_D8 = [
        0,       0,       0,       0,       0,     0,     0,     0;
        0, 2*a+c+d,   a+b+c,   a+b+c, 2*a+c+d,     0, a-b+d, a-b+d;
        0,   a+b+c, 2*a+c+e,   a+b+c, 2*a+c+e, a-b+e,     0, a-b+e;
        0,   a+b+c,   a+b+c, 2*a+c+f, 2*a+c+f, a-b+f, a-b+f,     0;
        0,   a+b+c,   a+b+c, 2*a+c+f, 2*a+c+f, a-b+f, a-b+f,     0;
        0, 2*a+c+d,   a+b+c,   a+b+c, 2*a+c+d,     0, a-b+d, a-b+d;
        0,   a+b+c, 2*a+c+e,   a+b+c, 2*a+c+e, a-b+e,     0, a-b+e;
        0,       0,       0,       0,       0,     0,     0,     0;
    ];

    H = D8 .* exp(2 * pi * i * R_D8);

end

