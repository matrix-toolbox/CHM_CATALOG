% 20160612
% W. Bruzda, name[at]alumni.uj.edu.pl | name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> H = D10_3(rand(1, 3))
% >> abs(H .* H'), norm(H * H' - 10 * eye(10), 'fro')

function H = D10_3(parameter)

    try
        a = parameter(1, 1);
        b = parameter(1, 2);
        c = parameter(1, 3);
    catch
        warning('No valid parameter provided! Continue with default zero value.');
        a = 0;
        b = 0;
        c = 0;
    end

    D10 = [
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1;
        1,-1,-i,-i,-i,-i, i, i, i, i;
        1,-i,-1, i, i,-i,-i,-i, i, i;
        1,-i, i,-1,-i, i,-i, i,-i, i;
        1,-i, i,-i,-1, i, i,-i, i,-i;
        1,-i,-i, i, i,-1, i, i,-i,-i;
        1, i,-i,-i, i, i,-1,-i,-i, i;
        1, i,-i, i,-i, i,-i,-1, i,-i;
        1, i, i,-i, i,-i,-i, i,-1,-i;
        1, i, i, i,-i,-i, i,-i,-i,-1;
    ];

    R_D10 = [
        0,   0,   0, 0,  0, 0,  0, 0,   0,   0;
        0,   0, a-b, a, -c, 0, -c, a, a-b,   0;
        0, b-a,   0, b, -c, 0, -c, b,   0, b-a;
        0,  -a,  -b, 0,  0, 0,  0, 0,  -b,  -a;
        0,   c,   c, 0,  0, 0,  0, 0,   c,   c;
        0,   0,   0, 0,  0, 0,  0, 0,   0,   0;
        0,   c,   c, 0,  0, 0,  0, 0,   c,   c;
        0,  -a,  -b, 0,  0, 0,  0, 0,  -b,  -a;
        0, b-a,   0, b, -c, 0, -c, b,   0, b-a;
        0,   0, a-b, a, -c, 0, -c, a, a-b,   0;
    ];
    
    H = D10 .* exp(2 * pi * i * R_D10);

end

