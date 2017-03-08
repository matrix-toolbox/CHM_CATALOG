% 20061205
% W. Bruzda, name[at]alumni.uj.edu.pl | name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> SIGMA = 1
% >> H = C7_0_SIGMA(SIGMA)
% >> abs(H .* H'),  norm(H * H' - 7 * eye(7), 'fro')

% SIGMA = 1 => C_7A
% SIGMA = 2 => C_7B
% SIGMA = 3 => C_7C
% SIGMA = 4 => C_7D

function H = C7_0_SIGMA(SIGMA)

    try
        if ((SIGMA == 1) || (SIGMA == 2))
            d = (i * sqrt(7) - 3) / 4; 
        elseif ((SIGMA == 3) || (SIGMA == 4))
            a = exp(i * 4.312839);
            b = exp(i * 1.356228);
            c = exp(i * 1.900668);
        end
    catch
        error('No valid SIGMA value provided! Sigma = 1 2 3 or 4.');
    end;

    if SIGMA == 1,
        H = [
            1,        1,        1,      1,        1,      1,      1;
            1,    (1/d),        1,      d,    (1/d),      d,      1;
            1,    (1/d),    (1/d),      d,        1,      1,      d;
            1,  (1/d^2),  (1/d^2),  (1/d),    (1/d),      1,  (1/d);
            1,        1,    (1/d),      1,    (1/d),      d,      d;
            1,  (1/d^2),    (1/d),  (1/d),  (1/d^2),  (1/d),      1;
            1,    (1/d),  (1/d^2),      1,  (1/d^2),  (1/d),  (1/d);
        ];
    elseif SIGMA == 2,
        H = [
            1,    1,    1,      1,    1,      1,      1;
            1,    d,    1,  (1/d),    d,  (1/d),      1;
            1,    d,    d,  (1/d),    1,      1,  (1/d);
            1,  d^2,  d^2,      d,    d,      1,      d;
            1,    1,    d,      1,    d,  (1/d),  (1/d);
            1,  d^2,    d,      d,  d^2,      d,      1;
            1,    d,  d^2,      1,  d^2,      d,      d;
        ];
    elseif SIGMA == 3,
        H = [
            1,           1,                   1,                       1,                       1,                   1,           1;
            1,     (1/a^2),         (1/a)*(1/b),             (1/a)*(1/c),                   (1/a),             (1/a)*c,     (1/a)*b;
            1, (1/a)*(1/b),     (1/a^2)*(1/b^2),     (1/a)*(1/b^2)*(1/c),       (1/a)*(1/b)*(1/c),       (1/a)*(1/b)*c,     (1/a)*c;
            1, (1/a)*(1/c), (1/a)*(1/b^2)*(1/c), (1/a^2)*(1/b^2)*(1/c^2),   (1/a)*(1/b^2)*(1/c^2),   (1/a)*(1/b)*(1/c),       (1/a);
            1,       (1/a),   (1/a)*(1/b)*(1/c),   (1/a)*(1/b^2)*(1/c^2), (1/a^2)*(1/b^2)*(1/c^2), (1/a)*(1/b^2)*(1/c), (1/a)*(1/c);
            1,     (1/a)*c,       (1/a)*(1/b)*c,       (1/a)*(1/b)*(1/c),     (1/a)*(1/b^2)*(1/c),     (1/a^2)*(1/b^2), (1/a)*(1/b);
            1,     (1/a)*b,             (1/a)*c,                   (1/a),             (1/a)*(1/c),         (1/a)*(1/b),     (1/a^2);
        ];
    elseif SIGMA == 4,
        H = [
            1,        1,            1,                  1,                  1,            1,        1;
            1,      a^2,          a*b,                a*c,                  a,      a*(1/c),  a*(1/b);
            1,      a*b,  (a^2)*(b^2),          a*(b^2)*c,              a*b*c,    a*b*(1/c),  a*(1/c);
            1,      a*c,    a*(b^2)*c,  (a^2)*(b^2)*(c^2),      a*(b^2)*(c^2),        a*b*c,        a;
            1,        a,        a*b*c,      a*(b^2)*(c^2),  (a^2)*(b^2)*(c^2),    a*(b^2)*c,      a*c;
            1,  a*(1/c),    a*b*(1/c),              a*b*c,          a*(b^2)*c,  (a^2)*(b^2),      a*b;
            1,  a*(1/b),      a*(1/c),                  a,                a*c,          a*b,      a^2;
        ];
    else
        error('Invalid SIGMA value! SIGMA = 1 2 3 or 4.');
    end

end

