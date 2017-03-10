% 20080526
% W. Bruzda, name[at]alumni.uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> H = Z10_1(rand(1, 1))
% >> abs(H .* H'), norm(H * H' - 10 * eye(10), 'fro')

function H = Z10_1(parameter)

    try
        a = parameter(1);
    catch
        warning('No valid parameter provided! Continue with defaul zero value.');
        a = 0;
    end

    Z10 = [ % LOG-form of BH(3, 10)
        0 0 0 0 0 0 0 0 0 0;
        0 3 1 1 4 3 4 0 1 4;
        0 3 0 4 5 2 6 2 4 2;
        0 6 5 3 3 3 1 3 1 5;
        0 1 3 5 6 1 4 3 2 4;
        0 3 3 1 4 6 2 3 5 0;
        0 3 3 4 2 5 0 5 1 2;
        0 1 4 2 6 4 2 6 4 3;
        0 5 0 1 2 5 4 3 3 2;
        0 5 2 4 2 2 3 6 4 6;
    ];

    R_Z10 = [
        0 0 0 0 0 0 0 0 0 0;
        0 0 a a a 0 a 0 a a;
        0 0 0 a 0 0 a 0 0 a;
        0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 a 0 0 0 a a;
        0 0 a a a 0 a 0 a a;
        0 0 0 a 0 0 a 0 0 a;
        0 0 a 0 a 0 a 0 0 0;
        0 0 a 0 a 0 a 0 0 0;
        0 0 0 0 a 0 0 0 a a;
    ];

    H = exp(Z10 * 2 * pi * i / 6) .* exp(2 * pi * i * R_Z10);

end

