function H = P8_3(R)
% 20171217
%
% [1] F. Szollosi
%    "On quaternary complex Hadamard matrices of small orders", AMC 5 309--315 (2011) 
% [2] S. Bouguezel, M.O. Ahmed and M.N.S. Swami
%    "A new class of reciprocal-orthogonal parametric transforms", IEEE Trans. Circuits and Syst. I 56 795–805 (2009)
%
% ~~ D8_5

a = exp(i*2*pi*R(1, 1));
b = exp(i*2*pi*R(1, 2));
c = exp(i*2*pi*R(1, 3));
H = [
    1  1  1  1  1  1  1  1;
    1 -a  b -c  c -b  a -1;
    1  a -b -c  c  b -a -1;
    1 -1 -1  1  1 -1 -1  1;
    1  a  b  c -c -b -a -1;
    1 -1  1 -1 -1  1 -1  1;
    1  1 -1 -1 -1 -1  1  1;
    1 -a -b  c -c  b  a -1;
];

end

