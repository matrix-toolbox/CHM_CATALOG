function [H] = D8_4(args)
% 20180225
% W. Bruzda, name[at]uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/
%
% Matolcsi et al. (arXiv:0607073) observe that
% S8^4(-pi/2, pi/2, pi/2, 0) and F8^5(-pi/4, -pi/2, pi/4, pi/2, pi/4) intersect at H8.
% "S8 and F8 both have defect 5 (they are not equivalent)
%  hence they are not subfamilies of a common family with defect > 5."
%
% >> version % 9.1.0.441655 (R2016b)
% >> H = D8_4(rand(1, 4))
% >> abs(H .* H'), norm(H * H' - 8 * eye(8), 'fro')

try
    a = args(1, 1);
    b = args(1, 2);
    c = args(1, 3);
    d = args(1, 4);
catch
    warning('No valid parameter provided! Continue with default zero value.');
    a = 0;
    b = 0;
    c = 0;
    d = 0;
end

D8 = [
    1  1  1  1  1  1  1  1;
    1  1 -1  1 -1 -1  1 -1;
    1  1  1 -1 -1 -1 -1  1;
    1 -1  1  1 -1  1 -1 -1;
    1 -1  1 -1  1 -1  1 -1;
    1 -1 -1  1  1 -1 -1  1;
    1  1 -1 -1  1  1 -1 -1;
    1 -1 -1 -1 -1  1  1  1;
];

D8_R = [
    0   0   0   0   0   0 0 0;
    0   a+b a   a   a+b 0 b b;
    0   a   a+c a   a+c c 0 c;
    0   a   a   a+d a+d d d 0;
    0   a   a   a+d a+d d d 0;
    0 a+b   a   a   a+b 0 b b;
    0   a   a+c a   a+c c 0 c;
    0   0   0   0   0   0 0 0;
];

H = D8 .* exp(i*D8_R);

end

