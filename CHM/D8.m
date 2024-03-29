function H = D8(p)
% ------------------------------------------------------------------------------
% 2018-02-25 Wojciech Bruzda; name[at]uj.edu.pl : name = w.bruzda
%            https://chaos.if.uj.edu.pl/~karol/hadamard/
%            https://github.com/matrix-toolbox/
% ------------------------------------------------------------------------------
% CHM stemming form BH(8, 2) depending on 4 parameters;
%
% >> H = D8(rand(1, 4));
% ------------------------------------------------------------------------------

    D8 = exp(2j*pi*[
        0 0 0 0 0 0 0 0;
        0 0 1 0 1 1 0 1;
        0 0 0 1 1 1 1 0;
        0 1 0 0 1 0 1 1;
        0 1 0 1 0 1 0 1;
        0 1 1 0 0 1 1 0;
        0 0 1 1 0 0 1 1;
        0 1 1 1 1 0 0 0;
    ]/2);

    R = [
        0   0         0         0         0         0    0    0   ;
        0   p(1)+p(2) p(1)      p(1)      p(1)+p(2) 0    p(2) p(2);
        0   p(1)      p(1)+p(3) p(1)      p(1)+p(3) p(3) 0    p(3);
        0   p(1)      p(1)      p(1)+p(4) p(1)+p(4) p(4) p(4) 0   ;
        0   p(1)      p(1)      p(1)+p(4) p(1)+p(4) p(4) p(4) 0   ;
        0   p(1)+p(2) p(1)      p(1)      p(1)+p(2) 0    p(2) p(2);
        0   p(1)      p(1)+p(3) p(1)      p(1)+p(3) p(3) 0    p(3);
        0   0         0         0         0         0    0    0   ;
    ];

   H = D8 .* exp(2j * pi * R);

end
