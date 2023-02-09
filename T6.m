function H = T6(p)
% ------------------------------------------------------------------------------
% 2008-10-20 WB
% 2021-05-15 Wojciech Bruzda; name[at]uj.edu.pl : name = w.bruzda
%            https://chaos.if.uj.edu.pl/~karol/hadamard/
%            https://github.com/matrix-toolbox/
% ------------------------------------------------------------------------------
% Non-affine family of CHM of order N = 6.
%
% Parameter m (or p) is a root of palindromic minimal polynomial:
% x^12 + 3x^11 + 8x^10 + 13x^8 - 3x^7 + 20x^6 - 3x^5 + 13x^4 + 8x^2 + 3x + 1
%  * sum of roots = -3
%  * product of roots = 1
%
% It might be a part of B6 family...
%
% >> H = T6(rand);
% ------------------------------------------------------------------------------

    warning("Scope of the parameter does not cover entire circle!");

    a = exp(2j * pi * p);
    % m = (- 2 - a' - a - sqrt(a' * a' + a * a + 2 + 4 * (a' + a))) / (2 * a');
    % p = (- 2 - a' - a + sqrt(a' * a' + a * a + 2 + 4 * (a' + a))) / (2 * a');
    b = a^2; % b = conj(- 1 - 2 * a' - c' - d');
    c = (-2*a - 1 - b - sqrt(1+a^4+2*a^2+4*a+4*a^3))/2;
    d = (-2*a - 1 - b + sqrt(1+a^4+2*a^2+4*a+4*a^3))/2;

    % q = 7 (11 ...)
    % (c*d)^q = 1
    % c*d = exp(12*1j*pi/q)

    H = [
        1 1 1  1  1  1;
        1 a b  c  a  d;
        1 b a  a  c  d;
        1 d a -a -1 -d;
        1 a d -1 -a -d;
        1 c c -c -c -1;
    ];

end
