% 20160612
% W. Bruzda, name[at]alumni.uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> H = G10_1(rand(1, 1))
% >> abs(H .* H'), norm(H * H' - 10 * eye(10), 'fro')

function H = G10_1(parameter)

    try
        a = parameter(1, 1);
    catch
        warning('No valid parameter provided! Continue with default zero value.');
        a = 0;
    end

    a = exp(2 * pi * i * a);
    b = conj(a);

    H = [
             1,      a,    a^2,  i*a^3, -i*a^4,      1,    i*a, -i*a^2,   -a^3,  i*a^4;
        -i*a^4,      1,      a,    a^2,  i*a^3,  i*a^4,      1,    i*a, -i*a^2,   -a^3;
         i*a^3, -i*a^4,      1,      a,    a^2,   -a^3,  i*a^4,      1,    i*a, -i*a^2;
           a^2,  i*a^3, -i*a^4,      1,      a, -i*a^2,   -a^3,  i*a^4,      1,    i*a;
             a,    a^2,  i*a^3, -i*a^4,      1,    i*a, -i*a^2,   -a^3,  i*a^4,      1;
             1, -i*b^4,   -b^3,  i*b^2,   -i*b,     -1, -i*b^4,  i*b^3,   -b^2,     -b;
          -i*b,      1, -i*b^4,   -b^3,  i*b^2,     -b,     -1, -i*b^4,  i*b^3,   -b^2;
         i*b^2,   -i*b,      1, -i*b^4,   -b^3,   -b^2,     -b,     -1, -i*b^4,  i*b^3;
          -b^3,  i*b^2,   -i*b,      1, -i*b^4,  i*b^3,   -b^2,     -b,     -1, -i*b^4;
        -i*b^4,   -b^3,  i*b^2,   -i*b,      1, -i*b^4,  i*b^3,   -b^2,     -b,     -1;
    ];

end

