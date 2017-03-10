% 20080526
% W. Bruzda, name[at]alumni.uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> H = N10B_1(rand(1, 1))
% >> abs(H .* H'), norm(H * H' - 10 * eye(10), 'fro')

function H = N10B_1(parameter)

    try
        a = parameter(1);
    catch
        warning('No valid parameter provided! Continue with defaul zero value.');
        a = 0;
    end

    N10B = [
        1  1  1  1  1  1  1  1  1  1;
        1  1 -1 -1  1  1 -i -1 -1  i;
        1  1  1 -i -1 -1 -1 -i  i  i;
        1 -1 -i  1  1 -1 -1  i -i  i;
        1 -i -i  i -1  1  i  1 -1 -1;
        1  i -i  i -i -1  1 -1  i -i;
        1 -i  i -i  i -1  1  i -1 -i;
        1 -1  i -i -i  1  i -1  1 -1;
        1  i -1 -1  i -i -1  1  1 -i;
        1 -1  i  i -1  i -i -i -i  1;
    ];

    R_N10B = [
        0 0  0  0 0 0 0 0 0 0;
        0 0  0  0 0 0 0 0 0 0;
        0 a  0  0 a 0 0 a a 0;
        0 a  0  0 a 0 0 a a 0;
        0 0 -a -a 0 0 0 0 0 0;
        0 0 -a -a 0 0 0 0 0 0;
        0 0 -a -a 0 0 0 0 0 0;
        0 0 -a -a 0 0 0 0 0 0;
        0 0  0  0 0 0 0 0 0 0;
        0 0  0  0 0 0 0 0 0 0;
    ];

    H = N10B .* exp(2 * pi * i * R_N10B);

end

