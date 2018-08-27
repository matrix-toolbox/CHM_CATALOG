function H = L14_2(parameter)
% 20171001
% W. Bruzda, name[at]uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox
%
% Taken from the Example 2.1 of https://arxiv.org/pdf/1707.02287.pdf by P. Lampio et al.
% It is permuted and dephased yet still equivalent to the original one.
%
% >> version % 9.1.0.441655 (R1016b)
% >> H = L14_1(rand(1, 2));
% >> abs(H .* H'), norm(H * H' - 14 * eye(14), 'fro') % ~ 0

    try
        a = parameter(1, 1);
        b = parameter(1, 2);
    catch
        warning('No valid parameter provided! Continue with default zero value.');
        a = 0;
        b = 0;
    end

    L14 = [ % LOG-form
         0 0 0 0 0 0 0 0 0 0 0 0 0 0;
         0 0 8 6 5 4 2 0 0 8 6 5 4 2;
         0 0 8 6 5 4 2 5 5 3 1 0 9 7;
         0 1 3 5 2 9 5 7 9 3 7 7 1 5;
         0 2 4 4 9 6 9 9 4 5 1 6 7 1;
         0 2 6 2 5 8 7 3 7 1 5 0 5 0;
         0 4 0 2 3 4 7 9 5 8 7 2 9 5;
         0 4 4 8 1 2 3 5 7 9 9 4 6 9;
         0 5 8 0 1 6 0 4 2 4 6 6 2 8;
         0 6 2 6 7 2 7 5 3 9 4 8 1 1;
         0 6 2 1 7 2 2 0 8 4 4 8 6 6;
         0 6 7 4 9 8 4 8 2 0 2 2 4 6;
         0 8 2 8 3 7 8 4 0 6 2 2 6 4;
         0 8 6 0 7 0 5 2 5 5 9 4 1 3;
    ];

    R_L14 = [
        0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 b b b b b b b;
        0 0 0 0 0 0 0 b b b b b b b;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 a 0 0 a a a a 0 0 a a;
        0 0 0 a 0 0 a a a a 0 0 a a;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0;
	  ];

    H = exp(2 * pi * i * L14 / 10) .* exp(2 * pi * i * R_L14);
end

