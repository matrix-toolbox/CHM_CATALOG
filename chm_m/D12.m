% 20160612
% W. Bruzda, name[at]alumni.uj.edu.pl | name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% >> H = D12
% >> abs(H .* H'), norm(H * H' - 12 * eye(12), 'fro')

function H = D12

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

