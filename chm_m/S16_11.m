% 20061205
% W. Bruzda, name[at]alumni.uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> H = S16_11(rand(1, 11))
% >> abs(H .* H'), norm(H * H' - 16 * eye(16), 'fro')

function H = S16_11(parameter)

    try
        a = parameter(1, 1);
        b = parameter(1, 2);
        c = parameter(1, 3);
        d = parameter(1, 4);
        e = parameter(1, 5);
        f = parameter(1, 6);
        g = parameter(1, 7);
        h = parameter(1, 8);
       i_ = parameter(1, 9);
       j_ = parameter(1, 10);
        k = parameter(1, 11);
    catch
        warning('No valid parameter provided! Continue with default zero value.');
        a = 0;
        b = 0;
        c = 0;
        d = 0;
        e = 0;
        f = 0;
        g = 0;
        h = 0;
       i_ = 0;
       j_ = 0;
        k = 0;
    end

    S16 = [ % LOG-form
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
        0, 4, 6, 2, 7, 3, 5, 1, 0, 4, 6, 2, 0, 4, 6, 2;
        0, 0, 4, 4, 6, 6, 2, 2, 0, 0, 4, 4, 0, 0, 4, 4;
        0, 4, 2, 6, 5, 1, 7, 3, 0, 4, 2, 6, 0, 4, 2, 6;
        0, 0, 0, 0, 4, 4, 4, 4, 5, 0, 0, 0, 1, 4, 4, 4;
        0, 4, 6, 2, 3, 7, 1, 5, 5, 4, 6, 2, 1, 0, 2, 6;
        0, 0, 4, 4, 2, 2, 6, 6, 5, 0, 4, 4, 1, 4, 0, 0;
        0, 4, 2, 6, 1, 5, 3, 7, 5, 4, 2, 6, 1, 0, 6, 2;
        0, 0, 0, 6, 0, 0, 0, 0, 4, 4, 4, 2, 4, 4, 4, 4;
        0, 4, 6, 0, 7, 3, 5, 1, 4, 0, 2, 4, 4, 0, 2, 6;
        0, 0, 4, 2, 6, 6, 2, 2, 4, 4, 0, 6, 4, 4, 0, 0;
        0, 4, 2, 4, 5, 1, 7, 3, 4, 0, 6, 0, 4, 0, 6, 2;
        0, 0, 0, 6, 4, 4, 4, 4, 1, 4, 4, 2, 5, 0, 0, 0;
        0, 4, 6, 0, 3, 7, 1, 5, 1, 0, 2, 4, 5, 4, 6, 2;
        0, 0, 4, 2, 2, 2, 6, 6, 1, 4, 0, 6, 5, 0, 4, 4;
        0, 4, 2, 4, 1, 5, 3, 7, 1, 0, 6, 0, 5, 4, 2, 6;
    ];

    R_S16 = [
        0, 0,        0,        0,        0,        0,        0,        0, 0, 0,        0,        0, 0, 0,        0,        0;
        0, 0, (h + i_),       i_,        c,        c,        b,        b, k, k,       i_,       i_, k, k,       i_, (h + i_);
        0, 0,        0,        0,        d,        d,        d,        d, 0, 0,        0,        0, 0, 0,        0,        0;
        0, 0, (h + i_),       i_, (c + j_), (c + j_), (b + j_), (b + j_), k, k,       i_,       i_, k, k,       i_, (h + i_);
        0, 0,        h,        0,        0,        0,        0,        0, a, f,        e,        0, a, f,        e,        h;
        0, 0,       i_,       i_,        c,        c,        b,        b, a, f, (e + i_),       i_, a, f, (e + i_),       i_;
        0, 0,        h,        0,        d,        d,        d,        d, a, f,        e,        0, a, f,        e,        h;
        0, 0,       i_,       i_, (c + j_), (c + j_), (b + j_), (b + j_), a, f, (e + i_),       i_, a, f, (e + i_),       i_;
        0, 0,        h,        g,        0,        0,        0,        0, 0, 0,        0,        g, 0, 0,        0,        h;
        0, 0,       i_, (g + i_),        c,        c,        b,        b, k, k,       i_, (g + i_), k, k,       i_,       i_;
        0, 0,        h,        g,        d,        d,        d,        d, 0, 0,        0,        g, 0, 0,        0,        h;
        0, 0,       i_, (g + i_), (c + j_), (c + j_), (b + j_), (b + j_), k, k,       i_, (g + i_), k, k,       i_,       i_;
        0, 0,        0,        g,        0,        0,        0,        0, a, f,        e,        g, a, f,        e,        0;
        0, 0, (h + i_), (g + i_),        c,        c,        b,        b, a, f, (e + i_), (g + i_), a, f, (e + i_), (h + i_);
        0, 0,        0,        g,        d,        d,        d,        d, a, f,        e,        g, a, f,        e,        0;
        0, 0, (h + i_), (g + i_), (c + j_), (c + j_), (b + j_), (b + j_), a, f, (e + i_), (g + i_), a, f, (e + i_), (h + i_);
    ];

    H = exp(S16 * 2 * pi * i / 8) .* exp(2 * pi * i * R_S16);

end

