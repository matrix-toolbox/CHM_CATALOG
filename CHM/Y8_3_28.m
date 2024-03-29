function Y = Y8_3_28
% ------------------------------------------------------------------------------
% 2008-05-26 Wojciech Bruzda; name[at]uj.edu.pl : name = w.bruzda
%            https://chaos.if.uj.edu.pl/~karol/hadamard/
%            https://github.com/matrix-toolbox/
% ------------------------------------------------------------------------------
% Butson type matrix BH(9, 30) with d = 3 and #L = 28.
% ------------------------------------------------------------------------------

    Y = exp(2j*pi*[
        0   0   0   0   0   0   0   0;
        0   6  17  21   2  15   3  18;
        0  12  21  15  14  29  27   6;
        0  18  15   9  26   3  11  24;
        0  24   9  23   8  27  15  12;
        0   0  24   6  20  18  12  10;
        0  10   6  24  20  12  18   0;
        0  20   2   8  10  14  26  20;
    ] / 30);

end


