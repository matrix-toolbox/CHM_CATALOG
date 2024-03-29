function H = D10(p)
% ------------------------------------------------------------------------------
% 2016-06-12 Wojciech Bruzda; name[at]uj.edu.pl : name = w.bruzda
%            https://chaos.if.uj.edu.pl/~karol/hadamard/
%            https://github.com/matrix-toolbox/
% ------------------------------------------------------------------------------
% CHM stemming form BH(10, 4) depending on 3 parameters;
% [1] https://arxiv.org/abs/math/0610297
%
% >> H = D10(rand(1, 3));
% ------------------------------------------------------------------------------

    D = exp(2j*pi*[
        0 0 0 0 0 0 0 0 0 0;
        0 2 3 3 3 3 1 1 1 1;
        0 3 2 1 1 3 3 3 1 1;
        0 3 1 2 3 1 3 1 3 1;
        0 3 1 3 2 1 1 3 1 3;
        0 3 3 1 1 2 1 1 3 3;
        0 1 3 3 1 1 2 3 3 1;
        0 1 3 1 3 1 3 2 1 3;
        0 1 1 3 1 3 3 1 2 3;
        0 1 1 1 3 3 1 3 3 2;
    ]/4);

    R = [
        0  0          0         0     0    0  0     0     0          0         ;
        0  0          p(1)-p(2) p(1) -p(3) 0 -p(3)  p(1)  p(1)-p(2)  0         ;
        0  p(2)-p(1)  0         p(2) -p(3) 0 -p(3)  p(2)  0          p(2)-p(1) ;
        0 -p(1)      -p(2)      0     0    0  0     0    -p(2)      -p(1)      ;
        0  p(3)       p(3)      0     0    0  0     0     p(3)       p(3)      ;
        0  0          0         0     0    0  0     0     0          0         ;
        0  p(3)       p(3)      0     0    0  0     0     p(3)       p(3)      ;
        0 -p(1)      -p(2)      0     0    0  0     0    -p(2)      -p(1)      ;
        0  p(2)-p(1)  0         p(2) -p(3) 0 -p(3)  p(2)  0          p(2)-p(1) ;
        0  0          p(1)-p(2) p(1) -p(3) 0 -p(3)  p(1)  p(1)-p(2)  0         ;
    ];

    H = D .* exp(2j * pi * R);

end
