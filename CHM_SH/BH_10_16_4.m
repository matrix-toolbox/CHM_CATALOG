function Y = BH_10_16_4
% ------------------------------------------------------------------------------
% 2023-02-26 Wojciech Bruzda; name[at]uj.edu.pl : name = w.bruzda
%            https://chaos.if.uj.edu.pl/~karol/hadamard/
%            https://github.com/matrix-toolbox/
% ------------------------------------------------------------------------------
% Symmetric BH(10, 4) with d = 16 and #L = 4.
% It is a special solution of "SH_10_0_143.m".
% ------------------------------------------------------------------------------

    Y = exp(2j*pi*[
        0  0  0  0  0  0  0  0  0  0;
        0  3  0  2  2  1  4  0  2  2;
        0  0  0  2  0  3  2  2  2  1;
        0  2  2  0  0  3  1  0  2  2;
        0  2  0  0  3  1  2  2  0  2;
        0  1  3  3  1  2  3  1  1  3;
        0  4  2  1  2  3  4  2  4  2;
        0  0  2  0  2  1  2  3  2  4;
        0  2  2  2  0  1  4  2  3  4;
        0  2  1  2  2  3  2  4  4  4;
    ] / 4);

end
