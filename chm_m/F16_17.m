% 20061205
% W. Bruzda, name[at]alumni.uj.edu.pl | name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> H = F16_17(rand(1, 17))
% >> abs(H .* H'), norm(H * H' - 16 * eye(16), 'fro')

function H = F16_17(parameter)

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
        l = parameter(1, 12);
        m = parameter(1, 13);
        n = parameter(1, 14);
        o = parameter(1, 15);
        p = parameter(1, 16);
        r = parameter(1, 17);
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
        l = 0;
        m = 0;
        n = 0;
        o = 0;
        p = 0;
        r = 0;
    end

    w = exp(2 * pi * i / 16);

    F16 = [
        1,    1,    1,    1,    1,    1,    1,    1,   1,    1,    1,    1,    1,    1,    1,    1;
        1,    w,  w^2,  w^3,  w^4,  w^5,  w^6,  w^7, w^8,  w^9, w^10, w^11, w^12, w^13, w^14, w^15;
        1,  w^2,  w^4,  w^6,  w^8, w^10, w^12, w^14,   1,  w^2,  w^4,  w^6,  w^8, w^10, w^12, w^14;
        1,  w^3,  w^6,  w^9, w^12, w^15,  w^2,  w^5, w^8, w^11, w^14,    w,  w^4,  w^7, w^10, w^13;
        1,  w^4,  w^8, w^12,    1,  w^4,  w^8, w^12,   1,  w^4,  w^8, w^12,    1,  w^4,  w^8, w^12;
        1,  w^5, w^10, w^15,  w^4,  w^9, w^14,  w^3, w^8, w^13,  w^2,  w^7, w^12,    w,  w^6, w^11;
        1,  w^6, w^12,  w^2,  w^8, w^14,  w^4, w^10,   1,  w^6, w^12,  w^2,  w^8, w^14,  w^4, w^10;
        1,  w^7, w^14,  w^5, w^12,  w^3, w^10,    w, w^8, w^15,  w^6, w^13,  w^4, w^11,  w^2,  w^9;
        1,  w^8,    1,  w^8,    1,  w^8,    1,  w^8,   1,  w^8,    1,  w^8,    1,  w^8,    1,  w^8;
        1,  w^9,  w^2, w^11,  w^4, w^13,  w^6, w^15, w^8,    w, w^10,  w^3, w^12,  w^5, w^14,  w^7;
        1, w^10,  w^4, w^14,  w^8,  w^2, w^12,  w^6,   1, w^10,  w^4, w^14,  w^8,  w^2, w^12,  w^6;
        1, w^11,  w^6,    w, w^12,  w^7,  w^2, w^13, w^8,  w^3, w^14,  w^9,  w^4, w^15, w^10,  w^5;
        1, w^12,  w^8,  w^4,    1, w^12,  w^8,  w^4,   1, w^12,  w^8,  w^4,    1, w^12,  w^8,  w^4;
        1, w^13, w^10,  w^7,  w^4,    w, w^14, w^11, w^8,  w^5,  w^2, w^15, w^12,  w^9,  w^6,  w^3;
        1, w^14, w^12, w^10,  w^8,  w^6,  w^4,  w^2,   1, w^14, w^12, w^10,  w^8,  w^6,  w^4,  w^2;
        1, w^15, w^14, w^13, w^12, w^11, w^10,  w^9, w^8,  w^7,  w^6,  w^5,  w^4,  w^3,  w^2,    w;
    ];

    R_F16 = [
        0, 0,  0,        0,  0,       0,       0,           0, 0, 0,  0,        0, 0,       0,       0,            0;
        0, a,  b,        c,  d,       e,       f,           g, 0, a,  b,        c, d,       e,       f,            g;
        0, h, i_,       j_,  0,       h,      i_,          j_, 0, h, i_,       j_, 0,       h,      i_,           j_;
        0, k,  l,        m,  d, (e-a+k), (f-b+l),     (g-c+m), 0, k,  l,        m, d, (e-a+k), (f-b+l),      (g-c+m);
        0, n,  0,        n,  0,       n,       0,           n, 0, n,  0,        n, 0,       n,       0,            n;
        0, o,  b,  (c-a+o),  d, (e-a+o),       f,     (g-a+o), 0, o,  b,  (c-a+o), d, (e-a+o),       f,      (g-a+o);
        0, p, i_, (j_-h+p),  0,       p,      i_,    (j_-h+p), 0, p, i_, (j_-h+p), 0,       p,      i_,     (j_-h+p);
        0, r,  l,  (m-k+r),  d, (e-a+r), (f-b+l), (g-c-k+m+r), 0, r,  l,  (m-k+r), d, (e-a+r), (f-b+l),  (g-c-k+m+r);
        0, 0,  0,        0,  0,       0,       0,           0, 0, 0,  0,        0, 0,       0,       0,            0;
        0, a,  b,        c,  d,       e,       f,           g, 0, a,  b,        c, d,       e,       f,            g;
        0, h, i_,       j_,  0,       h,      i_,          j_, 0, h, i_,       j_, 0,       h,      i_,           j_;
        0, k,  l,        m,  d, (e-a+k), (f-b+l),     (g-c+m), 0, k,  l,        m, d, (e-a+k), (f-b+l),      (g-c+m);
        0, n,  0,        n,  0,       n,       0,           n, 0, n,  0,        n, 0,       n,       0,            n;
        0, o,  b,  (c-a+o),  d, (e-a+o),       f,     (g-a+o), 0, o,  b,  (c-a+o), d, (e-a+o),       f,      (g-a+o);
        0, p, i_, (j_-h+p),  0,       p,      i_,    (j_-h+p), 0, p, i_, (j_-h+p), 0,       p,      i_,     (j_-h+p);
        0, r,  l,  (m-k+r),  d, (e-a+r), (f-b+l), (g-c-k+m+r), 0, r,  l,  (m-k+r), d, (e-a+r), (f-b+l),  (g-c-k+m+r);
    ];

    H = F16 .* exp(2 * pi * i * R_F16);

end


