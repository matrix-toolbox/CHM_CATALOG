% 20170308
% W. Bruzda, name[at]alumni.uj.edu.pl | name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> % omega is a root of the equation: w^2 + w + 1 = 0
% >> H = D10_8(omega, parameter)
% >> abs(H .* H'), norm(H * H' - 10 * eye(10), 'fro')

function H = D10_8(omega, parameter)

    try
        a = parameter(1, 1);
        b = parameter(1, 2);
        c = parameter(1, 3);
        d = parameter(1, 4);
        e = parameter(1, 5);
        f = parameter(1, 6);
        g = parameter(1, 7);
    catch
        warning('No valid parameter provided! Continue with default zero value.');
        a = 0;
        b = 0;
        c = 0;
        d = 0;
        e = 0;
        f = 0;
        g = 0;
    end

    try
        w = omega;
    catch
        warning('No valid OMEGA parameter provided! Continue with default value.');
        w = (- 1 - i * sqrt(3)) / 2;
    end

    H10_omega = [
        1  1    1    1    1    1  1    1    1    1;
        1  1    1    w    w^2 -1 -1    1    w^2  w;
        1  1    1    w^2  w   -1  1   -1    w    w^2;
        1  w    w^2  1    1   -1  w^2  w   -1    1;
        1  w^2  w    1    1   -1  w    w^2  1   -1;
        1  w^2  w    1   -1    1 -w   -w^2 -1   -1;
        1 -1    1    w    w^2  1 -1   -1   -w^2 -w;
        1  1   -1    w^2  w    1 -1   -1   -w   -w^2;
        1  w    w^2 -1    1    1 -w^2 -w   -1   -1;
        1 -1   -1   -1   -1   -1  1    1    1    1;
    ];

    R_H10_omega = [
        0 0       0       0       0       0       0     0     0     0;
        0 2*a+c+d a+b+c   a+b+c   a+b+c   2*a+c+d 0     a-b+d a-b+d a-b+d;
        0 a+b+c   2*a+c+e a+b+c   a+b+c   2*a+c+e a-b+e 0     a-b+e a-b+e;
        0 a+b+c   a+b+c   2*a+c+f a+b+c   2*a+c+f a-b+f a-b+f 0     a-b+f;
        0 a+b+c   a+b+c   a+b+c   2*a+c+g 2*a+c+g a-b+g a-b+g a-b+g 0;
        0 a+b+c   a+b+c   a+b+c   2*a+c+g 2*a+c+g a-b+g a-b+g a-b+g 0;
        0 2*a+c+d a+b+c   a+b+c   a+b+c   2*a+c+d 0     a-b+d a-b+d a-b+d;
        0 a+b+c   2*a+c+e a+b+c   a+b+c   2*a+c+e a-b+e 0     a-b+e a-b+e;
        0 a+b+c   a+b+c   2*a+c+f a+b+c   2*a+c+f a-b+f a-b+f 0     a-b+f;
        0 0       0       0       0       0       0     0     0     0;
    ];

    H = H10_omega .* exp(2 * pi * i * R_H10_omega);

end

