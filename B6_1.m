function H = B6_1(parameter)
% 20061205
% W. Bruzda, name[at]uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> H = B6_1(rand(1, 1))
% >> abs(H .* H'), norm(H * H' - 6 * eye(6), 'fro')

    try
        p = parameter(1, 1);
    catch
        warning('No valid parameter provided! Continue with default zero value.');
        p = 0;
    end

    p1 = acos((sqrt(3) - 1) / 2) / (2 * pi); % = 0.19035916268767
    p2 = 1 - acos((sqrt(3) - 1) / 2) / (2 * pi); % = 0.80964083731233
    t = exp(2 * pi * i * (p1 + p * (p2 - p1)));

    Bn = (1 + 2 * t + t * t - sqrt(2) * sqrt(1 + 2 * t + 2 * t ^ 3 + t ^ 4));
    Bx = Bn / (2 * t + 1 - t * t);
    Bz = Bn / (2 * t - 1 + t * t);
    By = (2 * t + 1 - t * t) / (t * (2 * t - 1 + t * t));

    H = [
        1,    1,     1,   1,     1,     1;
        1,   -1, -1/Bx,  -t,     t,  1/Bx;
        1,  -Bx,     1,   t,  1/By, -1/Bz;
        1, -1/t,   1/t,  -1, -1/Bz,  1/Bz;
        1,  1/t,    By, -Bz,     1, -1/Bx;
        1,   Bx,   -Bz,  Bz,   -Bx,    -1;
    ];

end

