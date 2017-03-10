% 20080526
% W. Bruzda, name[at]alumni.uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/

% version % 9.1.0.441655 (R2016b)

% ...

function H = CC14X_6(SIGMA_C7, parameter)

    error('Not implemented!')

end

% CC_{14\Sigma}^{(6)}

% SIGMA_C7 is in { AA, AB, AC, AD, BB, BC, BD, CC, CD, DD }

%          SIGMA_C7 = [ 1; 1 ] corresponds to AA
%          SIGMA_C7 = [ 1; 2 ]      .         AB
%          SIGMA_C7 = [ 1; 3 ]      .         AC
%          SIGMA_C7 = [ 1; 4 ]      .         AD
%          SIGMA_C7 = [ 2; 2 ]      .         BB
%          SIGMA_C7 = [ 2; 3 ]      .         BC
%          SIGMA_C7 = [ 2; 4 ]      .         BD
%          SIGMA_C7 = [ 3; 3 ]      .         CC
%          SIGMA_C7 = [ 3; 4 ]      .         CD
%          SIGMA_C7 = [ 4; 4 ]      .         DD

%    ...

%    C7_0_1 = C7_0_SIGMA(SIGMA_1);
%    C7_0_2 = C7_0_SIGMA(SIGMA_2);
%    % Dita's construction
%    H = [
%        C7_0_1, diag(exp(i * [ 0; parameter ]) * C7_0_2); ...
%        C7_0_1, - diag(exp(i * [ 0; parameter ]) * C7_0_2)
%    ];

