function H = F4(p)
% ------------------------------------------------------------------------------
% 2016-12-05 Wojciech Bruzda; name[at]uj.edu.pl : name = w.bruzda
%            https://chaos.if.uj.edu.pl/~karol/hadamard/
%            https://github.com/matrix-toolbox/
% ------------------------------------------------------------------------------
% Fourier CHM depending on 1 parameter;
%
% >> H = F4(rand);
% ------------------------------------------------------------------------------

    R = [
        0 0 0 0;
        0 p(1) 0 p(1);
        0 0 0 0;
        0 p(1) 0 p(1);
    ];

    H = FN(4) .* exp(2j * pi * R);
end
