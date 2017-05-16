% 20170331
% W. Bruzda, name[at]uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% BH matrices connected with V8X...

% Courtesy of Veit Elser. Unpublished notes, 2011.

% >> version % 9.1.0.441655 (R2016b)
% >> SIGMA = 1 % 2, 3 or 4
% >> H = V8_BH
% >> abs(H .* H'), norm(H * H' - 8 * eye(8), 'fro')

function H = V8_BH(SIGMA)

    a = i;
    b = - sqrt(i);
    c = a * b;

    V = [
        -1, -1,  b,  b,  c,  c,  a,  a;
        -1,  b, -1,  c,  b,  a,  c, -a;
         b, -1,  c, -1,  a,  b, -a,  c;
         b,  c, -1,  a, -1, -a,  b, -c;
         c,  b,  a, -1, -a, -1, -c,  b;
         c,  a,  b, -a, -1, -c, -1, -b;
         a,  c, -a,  b, -c, -1, -b, -1;
         a, -a,  c, -c,  b, -b, -1,  1;
    ];

    LD = diag([-1, -1, 1/b, 1/b, 1/c, 1/c, 1/a, 1/a]);
    RD = diag([1, 1, -1/b, -1/b, -1/c, -1/c, -1/a, -1/a]);

    H = LD * V * RD; % dephased form

end

