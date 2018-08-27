function H = C7X_0(SIGMA)
% 20061205
% W. Bruzda, name[at]uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% [46] G. Bjoerck, R. Froeberg,
%      A Faster Way to Count the Solutions of Inhomogeneus Systems of Algebraic Equations, with Applications to Cyclic n-roots,
%      Journal of Symbolic Computation 12, pp. 329-336, 1991

% >> version % 9.1.0.441655 (R2016b)
% >> SIGMA = 1
% >> H = C7X_0(SIGMA)
% >> abs(H .* H'),  norm(H * H' - 7 * eye(7), 'fro')

% SIGMA = 1 => C_{7A}^{(0)}
% SIGMA = 2 => C_{7B}^{(0)}
% SIGMA = 3 => C_{7C}^{(0)}
% SIGMA = 4 => C_{7D}^{(0)}

    try
        if ((SIGMA == 1) || (SIGMA == 2))
            d = (i * sqrt(7) - 3) / 4;
        elseif ((SIGMA == 3) || (SIGMA == 4))
            a = exp(i * 4.3128389787245); % data taken from [46]
            b = exp(i * 1.356227956787);
            c = exp(i * 1.900668281165);
        end
    catch
        error('No valid SIGMA value provided! Sigma = 1 2 3 or 4.');
    end;

    if SIGMA == 1,
        H = [
            1,     1,     1,  1,     1,  1,  1;
            1,    d',     1,  d,    d',  d,  1;
            1,    d',    d',  d,     1,  1,  d;
            1, 1/d^2, 1/d^2, d',    d',  1, d';
            1,     1,    d',  1,    d',  d,  d;
            1, 1/d^2,    d', d', 1/d^2, d',  1;
            1,    d', 1/d^2,  1, 1/d^2, d', d';
        ];
    elseif SIGMA == 2,
        H = [
            1,   1,   1,  1,   1,  1,  1;
            1,   d,   1, d',   d, d',  1;
            1,   d,   d, d',   1,  1, d';
            1, d^2, d^2,  d,   d,  1,  d;
            1,   1,   d,  1,   d, d', d';
            1, d^2,   d,  d, d^2,  d,  1;
            1,   d, d^2,  1, d^2,  d,  d;
        ];
    elseif SIGMA == 3,
        H = [
            1,     1,           1,                 1,                 1,           1,     1;
            1, 1/a^2,       a'*b',             a'*c',                a',        a'*c,  a'*b;
            1, a'*b', 1/a^2*1/b^2,       a'*1/b^2*c',          a'*b'*c',     a'*b'*c,  a'*c;
            1, a'*c', a'*1/b^2*c', 1/a^2*1/b^2*1/c^2,    a'*1/b^2*1/c^2,    a'*b'*c',    a';
            1,    a',    a'*b'*c',    a'*1/b^2*1/c^2, 1/a^2*1/b^2*1/c^2, a'*1/b^2*c', a'*c';
            1,  a'*c,     a'*b'*c,          a'*b'*c',       a'*1/b^2*c', 1/a^2*1/b^2, a'*b';
            1,  a'*b,        a'*c,                a',             a'*c',       a'*b', 1/a^2;
        ];
    elseif SIGMA == 4,
        H = [
            1,     1,       1,           1,           1,       1,    1;
            1,   a^2,     a*b,         a*c,           a,    a*c', a*b';
            1,   a*b, a^2*b^2,     a*b^2*c,       a*b*c,  a*b*c', a*c';
            1,   a*c, a*b^2*c, a^2*b^2*c^2,   a*b^2*c^2,   a*b*c,    a;
            1,     a,   a*b*c,   a*b^2*c^2, a^2*b^2*c^2, a*b^2*c,  a*c;
            1,  a*c',  a*b*c',       a*b*c,     a*b^2*c, a^2*b^2,  a*b;
            1,  a*b',    a*c',           a,         a*c,     a*b,  a^2;
        ];
    else
        error('Invalid SIGMA value! SIGMA = 1 2 3 or 4.');
    end

end

% k_0 = (5 - sqrt(21)) / 4 - i * (3 / 2) * sqrt((sqrt(21) - 3) / 2); % ERROR in the formulas in Haagerup's paper!
% k_1 = (3 - sqrt(21)) / 4 - i * 2 * sqrt((sqrt(21) - 3) / 2);
% k_2 = i * sqrt((sqrt(21) + 3) / 2);
% A = k_0 + k_1 * cos(2 * pi / 7) + k_2 * sin(2 * pi / 7);
% B = k_0 + k_1 * cos(8 * pi / 7) + k_2 * sin(8 * pi / 7);
% C = k_0 + k_1 * cos(4 * pi / 7) + k_2 * sin(4 * pi / 7);
% a = A;
% b = B / A;
% c = C / B;

