% 20061205
% W. Bruzda, name[at]alumni.uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> H = P13_2(rand(1, 2))
% >> abs(H .* H'),  norm(H * H' - 13 * eye(13), 'fro')

function H = P13_2(parameter)

    try
        e = parameter(1, 1);
        f = parameter(1, 2);
    catch
        warning('No valid parameter provided! Continue with default zero value.');
        e = 0;
        f = 0;
    end

    t = exp(2 * pi * i / 30);

    P13 = [
        1,         1,         1,         1,         1,         1,         1,         1,         1,    1,    1,    1,    1;
        1,        -1,      t^10,      -t^5,       t^5,   i * t^5,  -i * t^5,  i * t^15, -i * t^15, t^16,  t^4, t^22, t^28;
        1,      t^10,        -1,       t^5,      -t^5,  -i * t^5,   i * t^5, -i * t^15,  i * t^15, t^16,  t^4, t^22, t^28;
        1,      -t^5,       t^5,        -1,      t^10,  i * t^15, -i * t^15,   i * t^5,  -i * t^5,  t^4, t^16, t^28, t^22;
        1,       t^5,      -t^5,      t^10,        -1, -i * t^15,  i * t^15,  -i * t^5,   i * t^5,  t^4, t^16, t^28, t^22;
        1,   i * t^5,  -i * t^5,  i * t^25, -i * t^25,        -1,      t^10,      -t^5,       t^5, t^22, t^28,  t^4, t^16;
        1,  -i * t^5,   i * t^5, -i * t^25,  i * t^25,      t^10,        -1,       t^5,      -t^5, t^22, t^28,  t^4, t^16;
        1,  i * t^25, -i * t^25,   i * t^5,  -i * t^5,      -t^5,       t^5,        -1,      t^10, t^28, t^22, t^16,  t^4;
        1, -i * t^25,  i * t^25,  -i * t^5,   i * t^5,       t^5,      -t^5,      t^10,        -1, t^28, t^22, t^16,  t^4;
        1,       t^4,       t^4,      t^16,      t^16,      t^28,      t^28,      t^22,      t^22, t^20, t^10, t^10, t^10;
        1,      t^16,      t^16,       t^4,       t^4,      t^22,      t^22,      t^28,      t^28, t^10, t^20, t^10, t^10;
        1,      t^28,      t^28,      t^22,      t^22,      t^16,      t^16,       t^4,       t^4, t^10, t^10, t^20, t^10;
        1,      t^22,      t^22,      t^28,      t^28,       t^4,       t^4,      t^16,      t^16, t^10, t^10, t^10, t^20;
    ];

    G = angle(- cos(f) / 2 + i * (sqrt(2) / 4) * sqrt(7 - cos(2 * f))) - 2 * pi / 3;

    R_P13 = [
        0,        0,        0,        0,        0,       0,       0,       0,       0, 0, 0, 0, 0;
        0,        0,        0,        f,        f,       e,       e, (e + G), (e + G), 0, 0, 0, 0;
        0,        0,        0,        f,        f,       e,       e, (e + G), (e + G), 0, 0, 0, 0;
        0,        f,        f,        0,        0, (e + G), (e + G),       e,       e, 0, 0, 0, 0;
        0,        f,        f,        0,        0, (e + G), (e + G),       e,       e, 0, 0, 0, 0;
        0,       -e,       -e, -(e + G), -(e + G),       0,       0,      -f,      -f, 0, 0, 0, 0;
        0,       -e,       -e, -(e + G), -(e + G),       0,       0,      -f,      -f, 0, 0, 0, 0;
        0, -(e + G), -(e + G),       -e,       -e,      -f,      -f,       0,       0, 0, 0, 0, 0;
        0, -(e + G), -(e + G),       -e,       -e,      -f,      -f,       0,       0, 0, 0, 0, 0;
        0,        0,        0,        0,        0,       0,       0,       0,       0, 0, 0, 0, 0;
        0,        0,        0,        0,        0,       0,       0,       0,       0, 0, 0, 0, 0;
        0,        0,        0,        0,        0,       0,       0,       0,       0, 0, 0, 0, 0;
        0,        0,        0,        0,        0,       0,       0,       0,       0, 0, 0, 0, 0;
    ];

    H = P13 .* exp(i * R_P13);

end

