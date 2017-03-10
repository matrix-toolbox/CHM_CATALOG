% 20061205
% W. Bruzda, name[at]alumni.uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> SIGMA = 1
% >> H = C11X_0(SIGMA)
% >> abs(H .* H'), norm(H * H' - 11 * eye(11), 'fro')

% SIGMA = 1 => C_11A
% SIGMA = 2 => C_11B

function H = C11X_0(SIGMA)

    try
        if (SIGMA == 1) 
            e = (+ i * sqrt(11) - 5) / 6;
        elseif (SIGMA == 2), 
            e = (- i * sqrt(11) - 5) / 6;
        else
            error();
        end
    catch
       error('Invalid SIGMA value! SIGMA = 1 or 2.');
    end
  
    H = [
        1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1;
        1, e^(-1),      e, e^(-1),      1,      1,      e,      1,      1, e^(-1),      e;
        1, e^(-2), e^(-1), e^(-1), e^(-2), e^(-1),      1,      1, e^(-1), e^(-2), e^(-1);
        1,      1,      1, e^(-1),      1, e^(-1),      e,      e,      e, e^(-1),      1;
        1, e^(-1),      e, e^(-1), e^(-1),      1,      1,      e,      e,      1,      1;
        1, e^(-1),      1,      1, e^(-1), e^(-1),      e,      1,      e,      1,      e;
        1, e^(-2), e^(-1), e^(-2), e^(-1), e^(-2), e^(-1),      1, e^(-1), e^(-1),      1;
        1, e^(-1), e^(-1), e^(-2), e^(-2), e^(-1), e^(-1), e^(-1),      1, e^(-2),      1;
        1, e^(-1),      1, e^(-2), e^(-2), e^(-2),      1, e^(-1), e^(-1), e^(-1), e^(-1);
        1,      1,      e,      1, e^(-1), e^(-1),      1,      e,      1, e^(-1),      e;
        1, e^(-2),      1, e^(-1), e^(-1), e^(-2), e^(-1), e^(-1),      1, e^(-2), e^(-1);
    ];

end

