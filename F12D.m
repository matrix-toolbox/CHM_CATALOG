function H = F12D(p)
% ------------------------------------------------------------------------------
% 2016-06-12 Wojciech Bruzda; name[at]uj.edu.pl : name = w.bruzda
%            https://chaos.if.uj.edu.pl/~karol/hadamard/
%            https://github.com/matrix-toolbox/
% ------------------------------------------------------------------------------
% Fourier CHM depending on 9 parameters;
%
% >> H = F12D(rand(1, 9));
% ------------------------------------------------------------------------------

    R = [
        0 0    0    0              0    0    0 0              0    0    0    0;
        0 p(1) p(2) p(3)           p(4) p(1) 0 p(3)           p(2) p(1) p(4) p(3);
        0 p(5) 0    p(6)           0    p(5) 0 p(6)           0    p(5) 0    p(6);
        0 p(7) p(2) p(7)           p(4) p(7) 0 p(7)           p(2) p(7) p(4) p(7);
        0 p(8) 0    p(3)-p(1)+p(8) 0    p(8) 0 p(3)-p(1)+p(8) 0    p(8) 0    p(3)-p(1)+p(8);
        0 p(9) p(2) p(6)-p(5)+p(9) p(4) p(9) 0 p(6)-p(5)+p(9) p(2) p(9) p(4) p(6)-p(5)+p(9);
        0 0    0    0              0    0    0 0              0    0    0    0;
        0 p(1) p(2) p(3)           p(4) p(1) 0 p(3)           p(2) p(1) p(4) p(3);
        0 p(5) 0    p(6)           0    p(5) 0 p(6)           0    p(5) 0    p(6);
        0 p(7) p(2) p(7)           p(4) p(7) 0 p(7)           p(2) p(7) p(4) p(7);
        0 p(8) 0    p(3)-p(1)+p(8) 0    p(8) 0 p(3)-p(1)+p(8) 0    p(8) 0    p(3)-p(1)+p(8);
        0 p(9) p(2) p(6)-p(5)+p(9) p(4) p(9) 0 p(6)-p(5)+p(9) p(2) p(9) p(4) p(6)-p(5)+p(9);
    ];

    H = FN(12) .* exp(2j * pi * R);

end
