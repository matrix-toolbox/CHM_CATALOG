function H = H16D
% ------------------------------------------------------------------------------
% 2019-11-16 Wojciech Bruzda; name[at]uj.edu.pl : name = w.bruzda
%            https://chaos.if.uj.edu.pl/~karol/hadamard/
%            https://github.com/matrix-toolbox/
% ------------------------------------------------------------------------------
% Real HM of order N = 16 from BH(16, 2);
%
% >> H = H16D;
% ------------------------------------------------------------------------------

    H = exp(2j*pi*[
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1;
        0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1;
        0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0;
        0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1;
        0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0;
        0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0;
        0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1;
        0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1;
        0 0 0 1 0 1 1 1 1 1 1 0 1 0 0 0;
        0 0 1 0 1 1 1 0 1 1 0 1 0 0 0 1;
        0 0 1 1 1 0 0 1 1 1 0 0 0 1 1 0;
        0 1 0 0 1 0 1 1 1 0 1 1 0 1 0 0;
        0 1 0 1 1 1 0 0 1 0 1 0 0 0 1 1;
        0 1 1 0 0 1 0 1 1 0 0 1 1 0 1 0;
        0 1 1 1 0 0 1 0 1 0 0 0 1 1 0 1;
    ]/2);

end
