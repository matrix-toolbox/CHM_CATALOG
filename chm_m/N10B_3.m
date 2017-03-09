% 20160612
% W. Bruzda, name[at]alumni.uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> H = N10B_3(rand(1, 3))
% >> abs(H .* H'), norm(H * H' - 10 * eye(10), 'fro')

function H = N10B_3(parameter)

    try
        a = parameter(1, 1);
        b = parameter(1, 2);
        c = parameter(1, 3);
    catch
        warning('No valid parameter provided! Continue with default zero value.');
        a = 0;
        b = 0;
        c = 0;
    end

    a = exp(2 * pi * i * a);
    b = exp(2 * pi * i * b);
    c = exp(2 * pi * i * c);

    H = [
        1,          1,                    1,                    1,          1,  1,  1,        1,        1,    1;
        1,          1,                   -1,                   -1,          1,  1, -i,       -1,       -1,    i;
        1,          a,                    c,                 -i*c,         -a, -1, -c, -i*a*b*c,  i*a*b*c,  i*c;
        1,         -a,                 -i*c,                    c,          a, -1, -c,  i*a*b*c, -i*a*b*c,  i*c;
        1,         -i,         -i*conj(a)*c,          i*conj(a)*c,         -1,  1,  i,      b*c,     -b*c,   -1;
        1,  i*conj(b), -i*conj(a)*conj(b)*c,  i*conj(a)*conj(b)*c, -i*conj(b), -1,  c,       -c,      i*c, -i*c;
        1, -i*conj(b),  i*conj(a)*conj(b)*c, -i*conj(a)*conj(b)*c,  i*conj(b), -1,  c,      i*c,       -c, -i*c;
        1,         -1,          i*conj(a)*c,         -i*conj(a)*c,         -i,  1,  i,     -b*c,      b*c,   -1;
        1,          i,                   -c,                   -c,          i, -i, -1,        c,        c,   -i;
        1,         -1,                  i*c,                  i*c,         -1,  i, -i,     -i*c,     -i*c,    1;
    ];

end

