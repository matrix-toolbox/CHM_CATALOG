function H = D12
% ------------------------------------------------------------------------------
% 2016-06-12 Wojciech Bruzda; name[at]uj.edu.pl : name = w.bruzda
%            https://chaos.if.uj.edu.pl/~karol/hadamard/
%            https://github.com/matrix-toolbox/
% ------------------------------------------------------------------------------
% Example of BH(12, 4);
%
% >> H = D12;
% ------------------------------------------------------------------------------

  H = exp(2j*pi*[
        0 0 0 0 0 0 0 0 0 0 0 0;
        0 1 1 1 3 3 3 2 0 0 2 2;
        0 1 1 3 1 3 3 0 2 2 0 2;
        0 1 3 3 3 1 1 2 0 2 0 2;
        0 3 1 3 3 1 1 0 2 0 2 2;
        0 3 3 1 1 1 3 2 2 0 0 2;
        0 3 3 1 1 3 1 0 0 2 2 2;
        0 1 3 1 3 1 3 0 2 2 2 0;
        0 1 3 3 1 3 1 2 2 0 2 0;
        0 3 1 3 1 1 3 2 0 2 2 0;
        0 3 1 1 3 3 1 2 2 2 0 0;
        0 2 2 2 2 2 2 0 0 0 0 0;
    ]/4);

end
