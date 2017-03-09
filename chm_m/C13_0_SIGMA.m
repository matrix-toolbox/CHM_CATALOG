% 20061205
% W. Bruzda, name[at]alumni.uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> SIGMA = 1
% >> H = C13_0_SIGMA(SIGMA)
% >> abs(H .* H'), norm(H * H' - 13 * eye(13), 'fro')

% SIGMA = 1 => C_13A
% SIGMA = 2 => C_13B

function H = C13_0_SIGMA(SIGMA)

    try
        if (SIGMA == 1),
            c = (i * sqrt(130 + 2 * sqrt(13)) - 1 + sqrt(13)) / 12;
        elseif (SIGMA == 2),
            d = (i * sqrt(130 - 2 * sqrt(13)) - 1 - sqrt(13)) / 12;
        else
            error();
        end;
    catch
        error('Invalid SIGMA value! SIGMA = 1 or 2.');
    end 

    if SIGMA == 1
        H = [
            1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1;
            1, c^(-2),      c, c^(-3), c^(-1),      c, c^(-1), c^(-1), c^(-1), c^(-3), c^(-1),      c, c^(-3);
            1,      c,    c^2,      c, c^(-1),    c^3,    c^3,      c,      c, c^(-1), c^(-1),    c^3,      c;
            1, c^(-3),      c, c^(-2), c^(-1), c^(-1),      c,      c, c^(-1), c^(-3), c^(-3), c^(-1), c^(-1);
            1, c^(-1), c^(-1), c^(-1), c^(-2),      c, c^(-1),      c,      c, c^(-3), c^(-3), c^(-1), c^(-3);
            1,      c,    c^3, c^(-1),      c,    c^2,    c^3,      c,    c^3,      c, c^(-1),      c, c^(-1);
            1, c^(-1),    c^3,      c, c^(-1),    c^3,    c^2,    c^3,      c,      c,      c,      c, c^(-1);
            1, c^(-1),      c,      c,      c,      c,    c^3,    c^2,    c^3, c^(-1),      c,    c^3, c^(-1);
            1, c^(-1),      c, c^(-1),      c,    c^3,      c,    c^3,    c^2,      c, c^(-1),    c^3,      c;
            1, c^(-3), c^(-1), c^(-3), c^(-3),      c,      c, c^(-1),      c, c^(-2), c^(-1), c^(-1), c^(-1);
            1, c^(-1), c^(-1), c^(-3), c^(-3), c^(-1),      c,      c, c^(-1), c^(-1), c^(-2),      c, c^(-3);
            1,      c,    c^3, c^(-1), c^(-1),      c,      c,    c^3,    c^3, c^(-1),      c,    c^2,      c;
            1, c^(-3),      c, c^(-1), c^(-3), c^(-1), c^(-1), c^(-1),      c, c^(-1), c^(-3),      c, c^(-2);
        ];
    elseif SIGMA == 2
        H = [
            1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1;
            1, d^(-2),      d, d^(-3), d^(-1),      d, d^(-1), d^(-1), d^(-1), d^(-3), d^(-1),      d, d^(-3);
            1,      d,    d^2,      d, d^(-1),    d^3,    d^3,      d,      d, d^(-1), d^(-1),    d^3,      d;
            1, d^(-3),      d, d^(-2), d^(-1), d^(-1),      d,      d, d^(-1), d^(-3), d^(-3), d^(-1), d^(-1);
            1, d^(-1), d^(-1), d^(-1), d^(-2),      d, d^(-1),      d,      d, d^(-3), d^(-3), d^(-1), d^(-3);
            1,      d,    d^3, d^(-1),      d,    d^2,    d^3,      d,    d^3,      d, d^(-1),      d, d^(-1);
            1, d^(-1),    d^3,      d, d^(-1),    d^3,    d^2,    d^3,      d,      d,      d,      d, d^(-1);
            1, d^(-1),      d,      d,      d,      d,    d^3,    d^2,    d^3, d^(-1),      d,    d^3, d^(-1);
            1, d^(-1),      d, d^(-1),      d,    d^3,      d,    d^3,    d^2,      d, d^(-1),    d^3,      d;
            1, d^(-3), d^(-1), d^(-3), d^(-3),      d,      d, d^(-1),      d, d^(-2), d^(-1), d^(-1), d^(-1);
            1, d^(-1), d^(-1), d^(-3), d^(-3), d^(-1),      d,      d, d^(-1), d^(-1), d^(-2),      d, d^(-3);
            1,      d,    d^3, d^(-1), d^(-1),      d,      d,    d^3,    d^3, d^(-1),      d,    d^2,      d;
            1, d^(-3),      d, d^(-1), d^(-3), d^(-1), d^(-1), d^(-1),      d, d^(-1), d^(-3),      d, d^(-2);
        ];
    else
        error('Invalid SIGMA value! SIGMA = 1 or 2.');
    end

end

