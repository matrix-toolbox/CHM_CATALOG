function H = D12
% 20160612
% W. Bruzda, name[at]uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> version % 9.1.0.441655 (R2016b)
% >> H = D12
% >> abs(H .* H'), norm(H * H' - 12 * eye(12), 'fro')

    H = [
        1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1;
        1,  i,  i,  i, -i, -i, -i, -1,  1,  1, -1, -1;
        1,  i,  i, -i,  i, -i, -i,  1, -1, -1,  1, -1;
        1,  i, -i,  i, -i,  i, -i,  1, -1, -1, -1,  1;
        1, -i,  i, -i,  i,  i, -i, -1,  1, -1, -1,  1;
        1, -i, -i,  i,  i,  i, -i, -1, -1,  1,  1, -1;
        1, -i, -i,  i,  i, -i,  i,  1,  1, -1, -1, -1;
        1, -i,  i,  i, -i, -i,  i, -1, -1, -1,  1,  1;
        1,  i, -i, -i,  i, -i,  i, -1, -1,  1, -1,  1;
        1,  i, -i, -i, -i,  i,  i, -1,  1, -1,  1, -1;
        1, -i,  i, -i, -i,  i,  i,  1, -1,  1, -1, -1;
        1, -1, -1, -1, -1, -1, -1,  1,  1,  1,  1,  1;
    ];

end

