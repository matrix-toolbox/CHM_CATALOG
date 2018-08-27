function H = M6_1(parameter)
% 20061205
% W. Bruzda, name[at]uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> a = (1 + rand) * pi / 2 + fix(rand * 2) * pi % single parameter "a" in (pi/2, pi] or (3*pi/2, 2*pi]
% >> H = M6_1(a)
% >> abs(H .* H'), norm(H * H' - 6 * eye(6), 'fro')

    get_p = @() (1 + rand) * pi / 2 + fix(rand * 2) * pi;

    try
        p = mod(parameter(1, 1), 2 * pi); % modulo - normalize to [0, 2*pi)
        if (p > 0 && p <= pi / 2) || (p > pi && p <= 3 * pi / 2)
            warning('Parameter must be in (pi/2, pi] or (3*pi/2, 2*pi]. Continue with appropriate random value.');
            p = get_p();
        end
    catch
        warning('No valid parameter provided! Continue with appropriate random value.');
        p = get_p();
    end

    a = exp(i * p);

    t1 = a^2 + 2 * a - 1;
    t2 = 1 + a^2;
    t3 = 1 - 6 * a^2 + a^4;
    t4 = sqrt(1 + 4 * a^2 - 58 * a^4 + 4 * a^6 + a^8);
    t5 = sqrt(16 - abs(t2)^2) / (4 * abs(t2));
    t6 = i * t1 * sqrt(16 - abs(t1)^2) / (4 * abs(t1));

    b = (t3 - t4) / (4 * t1);
    c = (t3 + t4) / (4 * t1);
    d = t2 / 4 + i * t2 * t5;
    e = t2 / 4 - i * t2 * t5;
    f = t1 / 4 + t6;
    g = t1 / 4 - t6;

    H = [
        1,  1,  1,  1,  1,  1;
        1, -1,  a,  a, -a, -a;
        1,  a,  b,  c, -d, -e;
        1,  a,  c,  b, -e, -d;
        1, -a, -d, -e,  f,  g;
        1, -a, -e, -d,  g,  f;
    ];

end

