function H = S12(p)
% ------------------------------------------------------------------------------
% 2006-12-05 Wojciech Bruzda; name[at]uj.edu.pl : name = w.bruzda
%            https://chaos.if.uj.edu.pl/~karol/hadamard/
%            https://github.com/matrix-toolbox/
% ------------------------------------------------------------------------------
% A 5-parametric family of CHM stemming from BH(12, 36) found by M. Matolcsi et al.
% https://arxiv.org/abs/quant-ph/0607073
%
% >> S12(rand(1, 5));
% ------------------------------------------------------------------------------

    S12 = exp(2j*pi*[
        0  0  0  0  0  0  0  0  0  0  0  0;
        0 12 24 28  4 16  0 12 24  0 12 24;
        0 24 12 20  8 32  0 24 12  0 24 12;
        0 27  0  0  0  0 18  9 18 18 18 18;
        0  3 24 28  4 16 18 21  6 18 30  6;
        0 15 12 20  8 32 18 33 30 18  6 30;
        0  0  0 18 18 18  9  0  0 27 18 18;
        0 12 24 10 22 34  9 12 24 27 30  6;
        0 24 12  2 26 14  9 24 12 27  6 30;
        0 27  0 18 18 18 27  9 18  9  0  0;
        0  3 24 10 22 34 27 21  6  9 12 24;
        0 15 12  2 26 14 27 33 30  9 24 12;
    ]/36);

    R = [
        0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 p(1) p(1) p(1) 0 0 0 0 0 0;
        0 0 0 p(2) p(2) p(2) 0 0 0 0 0 0;
        0 p(4) p(5) 0 0 0 0 p(4) p(5) 0 0 0;
        0 p(4) p(5) p(1) p(1) p(1) 0 p(4) p(5) 0 0 0;
        0 p(4) p(5) p(2) p(2) p(2) 0 p(4) p(5) 0 0 0;
        0 0 0 0 0 0 p(3) 0 0 p(3) 0 0;
        0 0 0 p(1) p(1) p(1) p(3) 0 0 p(3) 0 0;
        0 0 0 p(2) p(2) p(2) p(3) 0 0 p(3) 0 0;
        0 p(4) p(5) 0 0 0 p(3) p(4) p(5) p(3) 0 0;
        0 p(4) p(5) p(1) p(1) p(1) p(3) p(4) p(5) p(3) 0 0;
        0 p(4) p(5) p(2) p(2) p(2) p(3) p(4) p(5) p(3) 0 0;
    ];

    H = S12 .* exp(2j * pi * R);

end
