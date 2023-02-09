function H = C11B
% ------------------------------------------------------------------------------
% 2006-12-05 Wojciech Bruzda; name[at]uj.edu.pl : name = w.bruzda
%            https://chaos.if.uj.edu.pl/~karol/hadamard/
%            https://github.com/matrix-toolbox/
% ------------------------------------------------------------------------------
% Symmetric isolated CHM of order N = 11.
%
% >> H = C11B;
% ------------------------------------------------------------------------------

    e = (-i*sqrt(11) - 5) / 6;
    a = e^(-2);
    b = e^(-1);
    c = e^( 1);
    H = [
        1 1 1 1 1 1 1 1 1 1 1;
        1 b a a 1 a 1 b b b b;
        1 a b b 1 a b a b 1 b;
        1 a b a b b 1 a 1 b b;
        1 1 1 b c b 1 b c 1 c;
        1 a a b b a b b 1 b 1;
        1 1 b 1 1 b c b c c 1;
        1 b a a b b b a b 1 1;
        1 b b 1 c 1 c b 1 1 c;
        1 b 1 b 1 b c 1 1 c c;
        1 b b b c 1 1 1 c c 1;
    ];

end
