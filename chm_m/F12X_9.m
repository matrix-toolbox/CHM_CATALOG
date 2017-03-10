% 20160612 - w.bruzda[at]alumni.uj.edu.pl
% W. Bruzda, name[at]alumni.uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> SIGMA = 1 % 2 3 or 4
% >> H = F12X_9(SIGMA, rand(1, 9))
% >> abs(H .* H'), norm(H * H' - 12 * eye(12), 'fro')

function H = F12X_9(SIGMA, parameter)

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
    end

    w = exp(2 * pi * i / 12);

    F12 = [
        1, 1   ,   1 ,   1,   1,   1 ,   1,   1 ,   1,   1,    1,    1;
        1, w   , w^2 , w^3, w^4, w^5 , w^6, w^7 , w^8, w^9, w^10, w^11;
        1, w^2 , w^4 , w^6, w^8, w^10,   1, w^2 , w^4, w^6, w^8 , w^10;
        1, w^3 , w^6 , w^9,   1, w^3 , w^6, w^9 ,   1, w^3, w^6 , w^9 ;
        1, w^4 , w^8 ,   1, w^4, w^8 ,   1, w^4 , w^8,   1, w^4 , w^8 ;
        1, w^5 , w^10, w^3, w^8, w   , w^6, w^11, w^4, w^9, w^2 , w^7 ;
        1, w^6 , 1   , w^6,   1, w^6 ,   1, w^6 ,   1, w^6,   1 , w^6 ;
        1, w^7 , w^2 , w^9, w^4, w^11, w^6, w   , w^8, w^3, w^10, w^5 ;
        1, w^8 , w^4 ,   1, w^8, w^4 ,   1, w^8 , w^4,   1, w^8 , w^4 ;
        1, w^9 , w^6 , w^3,   1, w^9 , w^6, w^3 ,   1, w^9, w^6 , w^3 ;
        1, w^10, w^8 , w^6, w^4, w^2 ,   1, w^10, w^8, w^6, w^4 , w^2 ;
        1, w^11, w^10, w^9, w^8, w^7 , w^6, w^5 , w^4, w^3, w^2 , w   ;
    ];

    if (SIGMA == 1)
        R_F12 = [
            0,  0, 0,      0, 0,      0, 0,  0, 0,      0, 0,      0;
            0,  a, b,      c, d,      e, 0,  a, b,      c, d,      e;
            0,  f, 0,      f, 0,      f, 0,  f, 0,      f, 0,      f;
            0,  g, b,  c-a+g, d,  e-a+g, 0,  g, b,  c-a+g, d,  e-a+g;
            0,  h, 0,      h, 0,      h, 0,  h, 0,      h, 0,      h;
            0, i_, b, c-a+i_, d, e-a+i_, 0, i_, b, c-a+i_, d, e-a+i_;
            0,  0, 0,      0, 0,      0, 0,  0, 0,      0, 0,      0;
            0,  a, b,      c, d,      e, 0,  a, b,      c, d,      e;
            0,  f, 0,      f, 0,      f, 0,  f, 0,      f, 0,      f;
            0,  g, b,  c-a+g, d,  e-a+g, 0,  g, b,  c-a+g, d,  e-a+g;
            0,  h, 0,      h, 0,      h, 0,  h, 0,      h, 0,      h;
            0, i_, b, c-a+i_, d, e-a+i_, 0, i_, b, c-a+i_, d, e-a+i_;
        ];
    elseif (SIGMA == 2)
        R_F12 = [
            0, 0,  0, 0,     0,      0, 0, 0,  0, 0,     0,      0;
            0, a,  b, c,     d,      e, 0, a,  b, c,     d,      e;
            0, f,  g, 0,     f,      g, 0, f,  g, 0,     f,      g;
            0, h, i_, c, d-a+h, e-b+i_, 0, h, i_, c, d-a+h, e-b+i_;
            0, 0,  0, 0,     0,      0, 0, 0,  0, 0,     0,      0;
            0, a,  b, c,     d,      e, 0, a,  b, c,     d,      e;
            0, f,  g, 0,     f,      g, 0, f,  g, 0,     f,      g;
            0, h, i_, c, d-a+h, e-b+i_, 0, h, i_, c, d-a+h, e-b+i_;
            0, 0,  0, 0,     0,      0, 0, 0,  0, 0,     0,      0;
            0, a,  b, c,     d,      e, 0, a,  b, c,     d,      e;
            0, f,  g, 0,     f,      g, 0, f,  g, 0,     f,      g;
            0, h, i_, c, d-a+h, e-b+i_, 0, h, i_, c, d-a+h, e-b+i_;
        ];
    elseif (SIGMA == 3)
        R_F12 = [
            0,  0, 0,      0, 0,      0, 0,  0, 0,      0, 0,      0;
            0,  a, b,      c, 0,      d, b,  a, 0,      c, b,      d;
            0,  e, f,      e, 0,      e, f,  e, 0,      e, f,      e;
            0,  g, 0,  c-a+g, 0,  d-a+g, 0,  g, 0,  c-a+g, 0,  d-a+g;
            0,  h, b,      h, 0,      h, b,  h, 0,      h, b,      h;
            0, i_, f, c-a+i_, 0, d-a+i_, f, i_, 0, c-a+i_, f, d-a+i_;
            0,  0, 0,      0, 0,      0, 0,  0, 0,      0, 0,      0;
            0,  a, b,      c, 0,      d, b,  a, 0,      c, b,      d;
            0,  e, f,      e, 0,      e, f,  e, 0,      e, f,      e;
            0,  g, 0,  c-a+g, 0,  d-a+g, 0,  g, 0,  c-a+g, 0,  d-a+g;
            0,  h, b,      h, 0,      h, b,  h, 0,      h, b,      h;
            0, i_, f, c-a+i_, 0, d-a+i_, f, i_, 0, c-a+i_, f, d-a+i_;
        ];
    elseif (SIGMA == 4)
        R_F12 = [
            0,  0, 0,      0, 0,  0, 0,      0, 0,  0, 0,      0;
            0,  a, b,      c, d,  a, 0,      c, b,  a, d,      c;
            0,  e, 0,      f, 0,  e, 0,      f, 0,  e, 0,      f;
            0,  g, b,      g, d,  g, 0,      g, b,  g, d,      g;
            0,  h, 0,  c-a+h, 0,  h, 0,  c-a+h, 0,  h, 0,  c-a+h;
            0, i_, b, f-e+i_, d, i_, 0, f-e+i_, b, i_, d, f-e+i_;
            0,  0, 0,      0, 0,  0, 0,      0, 0,  0, 0,      0;
            0,  a, b,      c, d,  a, 0,      c, b,  a, d,      c;
            0,  e, 0,      f, 0,  e, 0,      f, 0,  e, 0,      f;
            0,  g, b,      g, d,  g, 0,      g, b,  g, d,      g;
            0,  h, 0,  c-a+h, 0,  h, 0,  c-a+h, 0,  h, 0,  c-a+h;
            0, i_, b, f-e+i_, d, i_, 0, f-e+i_, b, i_, d, f-e+i_;
        ];
    else
        error('Invalid SIGMA value! SIGMA = 1 2 3 or 4.')
    end

    H = F12 .* exp(2 * pi * i * R_F12);

end

