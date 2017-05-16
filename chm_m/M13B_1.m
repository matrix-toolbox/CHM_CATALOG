% 20170330
% W. Bruzda, name[at]alumni.uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% Extension of the A. LaClair's matrix M13B to the 1-parametric maximal affine family.

% >> version % 9.1.0.441655 (R2016b)
% >> H = M13B_1(rand);
% >> defect(H) % 1
% >> norm(H * H' - 13 * eye(13), 'fro')

function H = M13B_1(parameter)

    try
        a = parameter(1, 1);
    catch
        warning('No valid parameter provided! Continue with default zero value.');
        a = 0;
    end

    M13_B = [
        0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 5 5 5 3 3 3 3 2 2 1 0 0;
        0 1 1 3 1 3 4 5 1 3 5 3 5;
        0 3 0 1 3 1 5 3 0 4 1 4 3;
        0 1 3 4 5 1 1 3 4 4 1 2 5;
        0 3 5 3 5 5 3 0 2 0 1 2 3;
        0 5 3 1 1 4 1 5 4 2 1 4 3;
        0 5 3 1 5 1 3 1 2 4 4 4 1;
        0 2 0 4 4 2 1 0 4 2 4 5 2;
        0 4 0 2 2 4 1 2 4 5 4 2 0;
        0 0 3 5 3 3 5 1 0 0 3 2 3;
        0 2 2 0 2 0 3 4 3 0 4 0 4;
        0 3 3 3 0 5 5 3 0 2 3 0 1;
    ];

    H = exp(2 * pi * i * M13_B / 6);

    R_M13_B = [
        0  0  0  0  0 0 0  0 0 0  0 0  0;
        0  0  0  a  0 a 0  0 0 a  0 a  0;
        0  0  0  0  0 0 0  0 0 0  0 0  0;
        0  0  0  a  0 a 0  0 0 a  0 a  0;
        0 -a -a  0 -a 0 0 -a 0 0 -a 0 -a;
        0  0  0  a  0 a 0  0 0 a  0 a  0;
        0 -a -a  0 -a 0 0 -a 0 0 -a 0 -a;
        0  0  0  a  0 a 0  0 0 a  0 a  0;
        0 -a -a  0 -a 0 0 -a 0 0 -a 0 -a;
        0 -a -a  0 -a 0 0 -a 0 0 -a 0 -a;
        0  0  0  a  0 a 0  0 0 a  0 a  0;
        0  0  0  0  0 0 0  0 0 0  0 0  0;
        0  0  0  a  0 a 0  0 0 a  0 a  0;
    ];

    H = H .* exp(2 * pi * i * R_M13_B);

end

