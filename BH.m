function H = BH(M, Q, V)
% ------------------------------------------------------------------------------
% 2016-11-29 Srdjan Budishin
% 2023-02-03 Wojciech Bruzda; name[at]uj.edu.pl : name = w.bruzda
%            https://chaos.if.uj.edu.pl/~karol/hadamard/
%            https://github.com/matrix-toolbox/
% ------------------------------------------------------------------------------
% Script generates a unitary unimodular matrix H of Butson type.
% M is the matrix size and Q is the number of phases.
% If Q = M it generates a DFT matrix. Otherwise it generates all known matrices up to M = 16.
% If there are several matrices with the same M and Q, V determines which matrix will be generated.
% The following values of [M, Q, V] are allowed excluding Q = M (V is ommited if V=1):
%
%    [4, 2]
%    [6, 3]
%    [6, 4]
%    [7, 6]
%    [8, 2]
%    [8, 4, 1-2]
%    [8, 20, 1-2]
%    [9, 3]
%    [9, 6]
%    [9, 10]
%    [10, 4]
%    [10, 5, 1-2]
%    [12, 2]
%    [12, 3]
%    [12, 4, 1-2]
%    [12, 6, 1-3]
%    [12, 36]
%    [13, 6, 1-3]
%    [13, 60]
%    [14, 4]
%    [14, 6, 1-2]
%    [14, 7]
%    [14, 10]
%    [16, 2, 1-5]
%    [16, 4, 1-3]
%    [16, 8, 1-2]
%    [21, 3]
%
% Example:
% >> M = 16; Q = 8; V = 1;
% >> H = BH(M, Q, V);
% >> assert(sum(sum(abs(H * H' - M * eye(M)))) < 1e-13)
% ------------------------------------------------------------------------------
% Comprehensive study of Butson type matrices of size N < 22 can be found in the Butson HOME by P. Lampio and F. Szöllősi;
% at https://wiki.aalto.fi/display/Butson/Butson+Home
%
% Here we provide only a few single isolated (defect=0) examples:
% >> H = BH(12, 6, 3);
% >> H = BH(14, 6, 2);
% >> H = BH(16, 4, 3);
% >> H = BH(21, 3);
% ------------------------------------------------------------------------------

    if ~exist('V')
        V = 0;
    end

    if M == Q % DFT
        H = mod((0 : M - 1)' * (0 : M - 1), M);
    elseif isequal([M, Q], [4, 2])
        H = (1 - hadamard(4)) / 2;
    elseif isequal([M, Q], [6, 3])
        H = [
            0 0 0 0 0 0;
            0 0 1 1 2 2;
            0 1 0 2 2 1;
            0 1 2 0 1 2;
            0 2 2 1 0 1;
            0 2 1 2 1 0;
        ];
    elseif isequal([M, Q], [6, 4])
        H = [
            0 0 0 0 0 0;
            0 2 1 3 3 1;
            0 1 2 1 3 3;
            0 3 1 2 1 3;
            0 3 3 1 2 1;
            0 1 3 3 1 2;
        ];
    elseif isequal([M, Q], [7, 6])
        H = [
            0 0 0 0 0 0 0;
            0 1 4 5 3 3 1;
            0 4 1 3 5 3 1;
            0 5 3 1 4 1 3;
            0 3 5 4 1 1 3;
            0 3 3 1 1 4 5;
            0 1 1 3 3 5 4;
        ];
    elseif isequal([M, Q], [8, 2])
        H = (1 - hadamard(8)) / 2;
    elseif isequal([M, Q, V], [8, 4, 1])
        H = [
            0 0 0 0 0 0 0 0;
            0 0 2 2 2 1 3 0;
            0 1 1 3 0 2 2 3;
            0 1 3 1 2 3 1 3;
            0 2 3 1 0 1 3 2;
            0 2 1 3 2 0 0 2;
            0 3 2 2 0 3 1 1;
            0 3 0 0 2 2 2 1;
        ];
    elseif isequal([M, Q, V], [8, 4, 2])
        H = [
            0 0 0 0 0 0 0 0;
            0 1 2 3 0 1 2 3;
            0 2 0 2 0 2 0 2;
            0 3 2 1 0 3 2 1;
            0 0 0 0 2 2 2 2;
            0 1 2 3 2 3 0 1;
            0 2 0 2 2 0 2 0;
            0 3 2 1 2 1 0 3;
        ];
    elseif isequal([M, Q, V], [8, 20, 1])
        H = [
            0,  0,  0,  0,  0,  0,  0,  0; % B_8A = T8^(1)(gamma) : gamma = 1/2, 1 or 13/10
            0,  5, 10, 13,  8,  3, 15, 18; % defect = 7
            0, 10,  5, 18,  3, 13, 15,  8; % see: T8_1.m
            0, 12,  7, 10, 15, 17,  5,  2;
            0, 17,  2, 15, 10,  7,  5, 12;
            0,  7, 17,  3, 13,  0, 10, 10;
            0,  2, 12,  8, 18, 10,  0, 10;
            0, 15, 15,  5,  5, 10, 10,  0;
        ];
    elseif isequal([M, Q, V], [8, 20, 2])
        H = [
            0,  0,  0,  0,  0,  0,  0,  0; % B_8B = T8^(1)(gamma) : gamma = 4/5
            0,  8, 10, 13,  5,  3, 15, 18; % defect = 11
            0, 18, 10,  3,  5, 13, 15,  8; % see: T8_1.m
            0, 12, 10,  7, 15, 17,  5,  2;
            0,  2, 10, 17, 15,  7,  5, 12;
            0, 10,  0,  0, 10,  0, 10, 10;
            0, 10,  0, 10,  0, 10,  0, 10;
            0,  0,  0, 10, 10, 10, 10,  0;
        ];
    elseif isequal([M, Q], [9, 3])
        H = [
            0 0 0 0 0 0 0 0 0;
            0 1 2 0 1 2 0 1 2;
            0 2 1 0 2 1 0 2 1;
            0 0 0 1 1 1 2 2 2;
            0 1 2 1 2 0 2 0 1;
            0 2 1 1 0 2 2 1 0;
            0 0 0 2 2 2 1 1 1;
            0 1 2 2 0 1 1 2 0;
            0 2 1 2 1 0 1 0 2;
        ];
    elseif isequal([M, Q], [9, 6])
        H = [
            0 0 0 0 0 0 0 0 0;
            0 2 4 0 2 4 4 0 2;
            0 4 2 0 4 2 4 2 0;
            0 0 0 2 2 2 4 4 4;
            0 2 4 2 4 0 2 4 0;
            0 4 2 2 0 4 2 0 4;
            0 2 2 4 0 0 5 3 3;
            0 4 0 4 2 4 1 3 1;
            0 0 4 4 4 2 1 1 3;
        ];
    elseif isequal([M, Q], [9, 10])
        H = [
            0 0 0 0 0 0 0 0 0;
            0 5 3 3 5 9 8 7 1;
            0 4 5 7 1 3 5 9 9;
            0 3 7 5 1 8 9 3 5;
            0 9 1 5 5 3 7 2 7;
            0 9 5 1 3 5 1 7 6;
            0 1 7 9 6 1 5 5 3;
            0 7 9 4 9 5 3 5 1;
            0 5 2 9 7 7 3 1 5;
        ];
    elseif isequal([M, Q], [10, 4])
        H=[
            0 0 0 0 0 0 0 0 0 0;
            0 2 3 3 3 3 1 1 1 1;
            0 3 2 1 1 3 3 3 1 1;
            0 3 1 2 3 1 3 1 3 1;
            0 3 1 3 2 1 1 3 1 3;
            0 3 3 1 1 2 1 1 3 3;
            0 1 3 3 1 1 2 3 3 1;
            0 1 3 1 3 1 3 2 1 3;
            0 1 1 3 1 3 3 1 2 3;
            0 1 1 1 3 3 1 3 3 2;
        ];
    elseif isequal([M, Q, V], [10, 5, 1])
        H = [
            0 0 0 0 0 0 0 0 0 0;
            0 0 1 1 2 2 3 3 4 4;
            0 1 0 3 2 4 1 4 2 3;
            0 1 3 4 3 1 0 2 4 2;
            0 2 3 0 1 3 4 1 2 4;
            0 2 4 2 0 1 3 4 3 1;
            0 3 1 2 4 0 4 2 1 3;
            0 3 2 4 1 4 2 3 0 1;
            0 4 2 1 4 3 1 0 3 2;
            0 4 4 3 3 2 2 1 1 0;
        ];
    elseif isequal([M, Q, V], [10, 5, 2])
        H = [
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0; % S_10 = S_10^{(0)}
            0, 1, 2, 3, 4, 4, 0, 1, 2, 3; % defect = 0
            0, 2, 4, 1, 3, 1, 3, 0, 2, 4;
            0, 3, 1, 4, 2, 1, 4, 2, 0, 3;
            0, 4, 3, 2, 1, 4, 3, 2, 1, 0;
            0, 3, 2, 2, 3, 0, 1, 4, 4, 1;
            0, 2, 0, 4, 4, 3, 2, 3, 1, 1;
            0, 1, 3, 1, 0, 2, 4, 3, 4, 2;
            0, 0, 1, 3, 1, 2, 2, 4, 3, 4;
            0, 4, 4, 0, 2, 3, 1, 1, 3, 2;
        ];
    elseif isequal([M, Q], [12, 2])
        H = [
            0 0 0 0 0 0 0 0 0 0 0 0;
            0 1 0 1 0 0 0 1 1 1 0 1;
            0 1 1 0 1 0 0 0 1 1 1 0;
            0 0 1 1 0 1 0 0 0 1 1 1;
            0 1 0 1 1 0 1 0 0 0 1 1;
            0 1 1 0 1 1 0 1 0 0 0 1;
            0 1 1 1 0 1 1 0 1 0 0 0;
            0 0 1 1 1 0 1 1 0 1 0 0;
            0 0 0 1 1 1 0 1 1 0 1 0;
            0 0 0 0 1 1 1 0 1 1 0 1;
            0 1 0 0 0 1 1 1 0 1 1 0;
            0 0 1 0 0 0 1 1 1 0 1 1;
        ];
    elseif isequal([M, Q], [12, 3])
        H = [
            0 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 1 1 1 1 2 2 2 2;
            0 0 0 1 0 2 2 2 1 1 1 2;
            0 0 1 2 2 0 1 2 0 1 2 1;
            0 1 0 2 2 1 2 0 2 0 1 1;
            0 1 2 0 1 2 0 2 0 2 1 1;
            0 1 2 1 2 0 0 1 2 1 0 2;
            0 1 2 2 0 2 1 1 1 0 2 0;
            0 2 1 0 2 0 2 1 1 2 1 0;
            0 2 1 1 0 2 1 0 2 2 0 1;
            0 2 1 2 1 1 0 2 1 0 0 2;
            0 2 2 1 1 1 2 0 0 1 2 0;
        ];
    elseif isequal([M, Q, V], [12, 4, 1])
        H = [
            0 0 0 0 0 0 0 0 0 0 0 0;
            0 2 0 2 0 2 0 2 0 2 0 2;
            0 0 2 2 1 1 3 3 3 3 1 1;
            0 2 2 0 1 3 3 1 3 1 1 3;
            0 0 1 1 2 2 1 1 3 3 3 3;
            0 2 1 3 2 0 1 3 3 1 3 1;
            0 0 3 3 1 1 2 2 1 1 3 3;
            0 2 3 1 1 3 2 0 1 3 3 1;
            0 0 3 3 3 3 1 1 2 2 1 1;
            0 2 3 1 3 1 1 3 2 0 1 3;
            0 0 1 1 3 3 3 3 1 1 2 2;
            0 2 1 3 3 1 3 1 1 3 2 0;
        ];
    elseif isequal([M, Q, V], [12, 4, 2])
        H = [
            0 0 0 0 0 0 0 0 0 0 0 0; % D_12 in BH(12, 4)
            0 1 1 1 3 3 3 2 0 0 2 2; % defect = 45
            0 1 1 3 1 3 3 0 2 2 0 2;
            0 1 3 1 3 1 3 0 2 2 2 0;
            0 3 1 3 1 1 3 2 0 2 2 0;
            0 3 3 1 1 1 3 2 2 0 0 2;
            0 3 3 1 1 3 1 0 0 2 2 2;
            0 3 1 1 3 3 1 2 2 2 0 0;
            0 1 3 3 1 3 1 2 2 0 2 0;
            0 1 3 3 3 1 1 2 0 2 0 2;
            0 3 1 3 3 1 1 0 2 0 2 2;
            0 2 2 2 2 2 2 0 0 0 0 0;
        ];
    elseif isequal([M, Q, V], [12, 6, 1])
        H = [
            0 0 0 0 0 0 0 0 0 0 0 0;
            0 3 0 3 0 3 0 3 0 3 0 3;
            0 0 3 3 0 0 3 3 0 0 3 3;
            0 3 3 0 0 3 3 0 0 3 3 0;
            0 0 0 0 2 2 2 2 4 4 4 4;
            0 3 0 3 2 5 2 5 4 1 4 1;
            0 0 3 3 2 2 5 5 4 4 1 1;
            0 3 3 0 2 5 5 2 4 1 1 4;
            0 0 0 0 4 4 4 4 2 2 2 2;
            0 3 0 3 4 1 4 1 2 5 2 5;
            0 0 3 3 4 4 1 1 2 2 5 5;
            0 3 3 0 4 1 1 4 2 5 5 2;
        ];
    elseif isequal([M, Q, V], [12, 6, 2])
        H = [
            0 0 0 0 0 0 0 0 0 0 0 0;
            0 3 0 3 0 3 0 3 0 3 0 3;
            0 0 0 0 2 2 2 2 4 4 4 4;
            0 3 0 3 2 5 2 5 4 1 4 1;
            0 0 2 2 0 0 4 4 4 4 2 2;
            0 3 2 5 0 3 4 1 4 1 2 5;
            0 0 2 2 4 4 0 0 2 2 4 4;
            0 3 2 5 4 1 0 3 2 5 4 1;
            0 0 4 4 4 4 2 2 0 0 2 2;
            0 3 4 1 4 1 2 5 0 3 2 5;
            0 0 4 4 2 2 4 4 2 2 0 0;
            0 3 4 1 2 5 4 1 2 5 0 3;
        ];
     elseif isequal([M, Q, V], [12, 6, 3])
        H = [
            0 0 0 0 0 0 0 0 0 0 0 0; % P. Lampio et al., https://wiki.aalto.fi/display/Butson/Butson+Home
            0 0 0 0 0 2 2 3 3 3 4 4; % defect = 0
            0 0 0 2 3 4 4 0 0 2 3 3;
            0 0 4 3 2 1 5 2 4 4 0 2;
            0 2 2 5 0 5 5 4 4 2 2 2;
            0 2 4 0 4 2 4 0 2 4 2 0;
            0 2 4 2 4 0 2 3 5 1 4 0;
            0 2 4 4 1 4 2 0 2 0 5 3;
            0 4 0 3 2 5 1 4 2 4 2 0;
            0 4 2 0 4 4 2 2 0 4 0 2;
            0 4 2 2 4 2 0 5 3 1 0 4;
            0 4 2 4 1 2 4 2 0 0 3 5;
        ];
     elseif isequal([M, Q], [12, 36])
         H = [
            0  0  0  0  0  0  0  0  0  0  0  0;
            0 12 24 28  4 16  0 12 24  0 12 24;
            0 24 12 20  8 32  0 24 12  0 24 12;
            0 27  0  0  0  0 18  9 18 18 18 18;
            0  3 24 28  4 16 18 21  6 18 30  6;
            0 15 12 20  8 32 18 33 30 18  6 30;
            0  0  0 18 18 18  9  0  0 27 18 18;
            0 12 24 10 22 34  9 12 24 27 30  6;
            0 24 12  2 26 14  9 24 12 27  6 30;
            0 27  0 18 18 18 27  9 18  9  0  0;
            0  3 24 10 22 34 27 21  6  9 12 24;
            0 15 12  2 26 14 27 33 30  9 24 12;
        ];
   elseif isequal([M, Q, V], [13, 6, 1])
         H = [
            0 0 0 0 0 0 0 0 0 0 0 0 0; % M_13A
            0 5 5 4 4 4 4 2 2 2 1 1 1; % BH(13, 6) taken from the thesis of Adam J. LaClair
            0 5 5 1 2 2 2 4 4 4 1 1 4; % "A Survey On Hadamard Matrices", UT, Knoxville, May 2016
            0 1 1 2 4 4 1 4 2 2 5 5 4; % defect = 0
            0 1 1 4 2 2 4 1 4 4 5 5 2;
            0 1 4 4 5 1 2 2 5 1 4 2 4;
            0 2 4 1 4 1 5 1 2 4 2 4 5;
            0 2 4 2 1 5 4 4 1 5 4 1 2;
            0 2 4 5 2 4 1 5 4 1 2 4 1;
            0 4 1 4 1 5 2 2 1 5 2 4 4;
            0 4 2 1 1 4 5 1 4 2 4 2 5;
            0 4 2 2 5 1 4 4 5 1 1 4 2;
            0 4 2 5 4 2 1 5 1 4 4 2 1;
        ];
    elseif isequal([M, Q, V], [13, 6, 2]) 
        H = [
            0 0 0 0 0 0 0 0 0 0 0 0 0; % M_13B
            0 5 5 5 3 3 3 3 2 2 1 0 0; % BH(13, 6) taken from the thesis of Adam J. LaClair
            0 1 1 3 1 3 4 5 1 3 5 3 5; % "A Survey On Hadamard Matrices", UT, Knoxville, May 2016
            0 3 0 1 3 1 5 3 0 4 1 4 3; % defect = 1
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
    elseif isequal([M, Q, V], [13, 6, 3])
        H = [
            0 0 0 0 0 0 0 0 0 0 0 0 0; % M_13C
            0 5 5 5 4 3 3 2 2 2 2 0 0; % BH(13, 6) taken from the thesis of Adam J. LaClair
            0 2 4 2 0 1 4 1 2 4 4 0 4; % "A Survey On Hadamard Matrices", UT, Knoxville, May 2016
            0 2 0 0 3 2 1 3 5 5 3 5 3; % defect = 2
            0 2 1 4 1 4 4 5 3 1 1 5 3;
            0 2 4 1 3 4 4 1 5 1 5 3 1;
            0 0 4 2 3 5 0 4 2 0 2 2 4;
            0 5 2 2 3 2 0 5 3 3 5 5 1;
            0 4 4 0 0 1 2 4 4 2 0 2 3;
            0 0 2 4 0 3 0 2 0 2 4 3 4;
            0 4 0 4 2 5 2 0 1 4 4 2 2;
            0 4 2 2 0 5 2 2 4 5 2 4 0;
            0 2 2 4 4 1 4 4 0 4 1 2 0;
        ];
    elseif isequal([M, Q], [13, 60])
        H = [
            0  0  0  0  0  0  0  0  0  0  0  0  0;
            0 30 20 40 10 25 55 45 15 32  8 44 56;
            0 20 30 10 40 55 25 15 45 32  8 44 56;
            0 40 10 30 20 45 15 25 55  8 32 56 44;
            0 10 40 20 30 15 45 55 25  8 32 56 44;
            0 25 55  5 35 30 20 40 10 44 56  8 32;
            0 55 25 35  5 20 30 10 40 44 56  8 32;
            0  5 35 25 55 40 10 30 20 56 44 32  8;
            0 35  5 55 25 10 40 20 30 56 44 32  8;
            0  8  8 32 32 56 56 44 44 40 20 20 20;
            0 32 32  8  8 44 44 56 56 20 40 20 20;
            0 56 56 44 44 32 32  8  8 20 20 40 20;
            0 44 44 56 56  8  8 32 32 20 20 20 40;
        ];
    elseif isequal([M, Q], [14, 4])
        H = [
            0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 2 1 3 1 1 3 3 3 3 1 1 3 1;
            0 1 2 1 3 1 1 3 3 3 3 1 1 3;
            0 3 1 2 1 3 1 1 3 3 3 3 1 1;
            0 1 3 1 2 1 3 1 1 3 3 3 3 1;
            0 1 1 3 1 2 1 3 1 1 3 3 3 3;
            0 3 1 1 3 1 2 1 3 1 1 3 3 3;
            0 3 3 1 1 3 1 2 1 3 1 1 3 3;
            0 3 3 3 1 1 3 1 2 1 3 1 1 3;
            0 3 3 3 3 1 1 3 1 2 1 3 1 1;
            0 1 3 3 3 3 1 1 3 1 2 1 3 1;
            0 1 1 3 3 3 3 1 1 3 1 2 1 3;
            0 3 1 1 3 3 3 3 1 1 3 1 2 1;
            0 1 3 1 1 3 3 3 3 1 1 3 1 2;
        ];
    elseif isequal([M, Q, V], [14, 6, 1])
        H = [
            0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 3 0 3 0 3 0 3 0 3 0 3 0 3;
            0 0 1 1 4 4 5 5 3 3 3 3 1 1;
            0 3 1 4 4 1 5 2 3 0 3 0 1 4;
            0 0 4 4 1 1 3 3 5 5 3 3 1 1;
            0 3 4 1 1 4 3 0 5 2 3 0 1 4;
            0 0 5 5 3 3 1 1 4 4 1 1 3 3;
            0 3 5 2 3 0 1 4 4 1 1 4 3 0;
            0 0 3 3 5 5 4 4 1 1 1 1 3 3;
            0 3 3 0 5 2 4 1 1 4 1 4 3 0;
            0 0 3 3 3 3 1 1 1 1 4 4 5 5;
            0 3 3 0 3 0 1 4 1 4 4 1 5 2;
            0 0 1 1 1 1 3 3 3 3 5 5 4 4;
            0 3 1 4 1 4 3 0 3 0 5 2 4 1;
        ];
    elseif isequal([M, Q, V], [14, 6, 2])
        H = [
            0 0 0 0 0 0 0 0 0 0 0 0 0 0; % P. Lampio et al., https://wiki.aalto.fi/display/Butson/Butson+Home
            0 0 0 0 0 0 2 2 3 3 3 3 4 4; % defect = 0
            0 0 0 1 3 3 4 5 1 2 4 5 2 3; % BH-offset = 7860
            0 0 2 3 3 5 0 4 4 1 2 3 1 5;
            0 0 4 3 4 2 1 2 3 5 4 0 0 2;
            0 1 3 0 3 4 3 0 5 4 1 2 5 2;
            0 2 1 4 0 3 0 4 1 5 2 4 4 2;
            0 2 4 5 3 1 4 3 2 1 1 0 4 5;
            0 3 0 4 2 0 4 0 3 5 4 2 2 1;
            0 3 4 1 1 5 0 3 4 3 0 5 2 2;
            0 3 5 3 2 3 1 1 0 2 5 3 5 5;
            0 4 2 2 5 5 3 3 0 1 4 1 4 1;
            0 4 2 4 0 2 4 1 5 3 2 0 1 4;
            0 4 3 1 5 2 2 5 2 5 0 3 2 5;
        ];
    elseif isequal([M, Q], [14, 7])
        H = [
            0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 1 2 3 4 5 6 0 1 2 3 4 5 6;
            0 2 4 6 1 3 5 2 4 6 1 3 5 0;
            0 3 6 2 5 1 4 6 2 5 1 4 0 3;
            0 4 1 5 2 6 3 5 2 6 3 0 4 1;
            0 5 3 1 6 4 2 6 4 2 0 5 3 1;
            0 6 5 4 3 2 1 2 1 0 6 5 4 3;
            0 1 3 6 3 1 0 5 5 4 2 6 2 4;
            0 0 1 3 6 3 1 4 5 5 4 2 6 2;
            0 6 6 0 2 5 2 1 3 4 4 3 1 5;
            0 5 4 4 5 0 3 3 6 1 2 2 1 6;
            0 4 2 1 1 2 4 3 0 3 5 6 6 5;
            0 3 0 5 4 4 5 1 6 3 6 1 2 2;
            0 2 5 2 0 6 6 4 3 1 5 1 3 4;
        ];
    elseif isequal([M, Q], [14, 10])
        H = [
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
    elseif isequal([M, Q, V], [16, 2, 1]) % H = hadamard(8);
        H = [
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1;
            0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1;
            0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0;
            0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1;
            0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0;
            0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0;
            0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1;
            0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1;
            0 1 0 1 0 1 0 1 1 0 1 0 1 0 1 0;
            0 0 1 1 0 0 1 1 1 1 0 0 1 1 0 0;
            0 1 1 0 0 1 1 0 1 0 0 1 1 0 0 1;
            0 0 0 0 1 1 1 1 1 1 1 1 0 0 0 0;
            0 1 0 1 1 0 1 0 1 0 1 0 0 1 0 1;
            0 0 1 1 1 1 0 0 1 1 0 0 0 0 1 1;
            0 1 1 0 1 0 0 1 1 0 0 1 0 1 1 0;
        ];
    elseif isequal([M, Q, V], [16, 2, 2])
        H = [
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1;
            0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1;
            0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0;
            0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1;
            0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0;
            0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0;
            0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1;
            0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1;
            0 1 0 1 0 1 1 0 1 0 1 0 1 0 0 1;
            0 0 1 1 0 0 1 1 1 1 0 0 1 1 0 0;
            0 1 1 0 0 1 0 1 1 0 0 1 1 0 1 0;
            0 0 0 0 1 1 1 1 1 1 1 1 0 0 0 0;
            0 1 0 1 1 0 0 1 1 0 1 0 0 1 1 0;
            0 0 1 1 1 1 0 0 1 1 0 0 0 0 1 1;
            0 1 1 0 1 0 1 0 1 0 0 1 0 1 0 1;
        ];
    elseif isequal([M, Q, V], [16, 2, 3])
        H = [
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1;
            0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1;
            0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0;
            0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1;
            0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0;
            0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0;
            0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1;
            0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1;
            0 0 0 0 1 1 1 1 1 1 1 1 0 0 0 0;
            0 0 1 1 0 1 0 1 1 1 0 0 1 0 1 0;
            0 0 1 1 1 0 1 0 1 1 0 0 0 1 0 1;
            0 1 0 1 0 1 1 0 1 0 1 0 1 0 0 1;
            0 1 0 1 1 0 0 1 1 0 1 0 0 1 1 0;
            0 1 1 0 0 0 1 1 1 0 0 1 1 1 0 0;
            0 1 1 0 1 1 0 0 1 0 0 1 0 0 1 1;
        ];
    elseif isequal([M, Q, V], [16, 2, 4])
        H = [
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1;
            0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1;
            0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0;
            0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1;
            0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0;
            0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0;
            0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1;
            0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1;
            0 0 0 1 0 1 1 1 1 1 1 0 1 0 0 0;
            0 0 1 0 1 1 1 0 1 1 0 1 0 0 0 1;
            0 0 1 1 1 0 0 1 1 1 0 0 0 1 1 0;
            0 1 0 0 1 0 1 1 1 0 1 1 0 1 0 0;
            0 1 0 1 1 1 0 0 1 0 1 0 0 0 1 1;
            0 1 1 0 0 1 0 1 1 0 0 1 1 0 1 0;
            0 1 1 1 0 0 1 0 1 0 0 0 1 1 0 1;
        ];
    elseif isequal([M, Q, V], [16, 2, 5])
        H = [
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 1 0 1 0 1 0 1 0 0 0 0 1 1 1 1;
            0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1;
            0 1 1 0 0 1 1 0 0 1 0 1 0 1 0 1;
            0 0 0 0 1 1 1 1 0 0 1 1 1 1 0 0;
            0 1 0 1 1 0 1 0 0 1 1 0 0 1 1 0;
            0 0 1 1 1 1 0 0 0 1 1 0 1 0 0 1;
            0 1 1 0 1 0 0 1 0 1 0 1 1 0 1 0;
            0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1;
            0 1 0 1 0 1 0 1 1 1 1 1 0 0 0 0;
            0 0 1 1 0 0 1 1 1 1 0 0 1 1 0 0;
            0 1 1 0 0 1 1 0 1 0 1 0 1 0 1 0;
            0 0 0 0 1 1 1 1 1 1 0 0 0 0 1 1;
            0 1 0 1 1 0 1 0 1 0 0 1 1 0 0 1;
            0 0 1 1 1 1 0 0 1 0 0 1 0 1 1 0;
            0 1 1 0 1 0 0 1 1 0 1 0 0 1 0 1;
        ];
    elseif isequal([M, Q, V], [16, 4, 1])
        H = [
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 1 2 3 0 1 2 3 0 1 2 3 0 1 2 3;
            0 2 0 2 0 2 0 2 0 2 0 2 0 2 0 2;
            0 3 2 1 0 3 2 1 0 3 2 1 0 3 2 1;
            0 0 0 0 1 1 1 1 2 2 2 2 3 3 3 3;
            0 1 2 3 1 2 3 0 2 3 0 1 3 0 1 2;
            0 2 0 2 1 3 1 3 2 0 2 0 3 1 3 1;
            0 3 2 1 1 0 3 2 2 1 0 3 3 2 1 0;
            0 0 0 0 2 2 2 2 0 0 0 0 2 2 2 2;
            0 1 2 3 2 3 0 1 0 1 2 3 2 3 0 1;
            0 2 0 2 2 0 2 0 0 2 0 2 2 0 2 0;
            0 3 2 1 2 1 0 3 0 3 2 1 2 1 0 3;
            0 0 0 0 3 3 3 3 2 2 2 2 1 1 1 1;
            0 1 2 3 3 0 1 2 2 3 0 1 1 2 3 0;
            0 2 0 2 3 1 3 1 2 0 2 0 1 3 1 3;
            0 3 2 1 3 2 1 0 2 1 0 3 1 0 3 2;
        ];
    elseif isequal([M, Q, V], [16, 4, 2])
        H = [
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 2 0 2 0 2 0 2 0 2 0 2 0 2 0 2;
            0 0 0 0 2 2 2 2 2 2 1 1 3 3 0 0;
            0 2 0 2 2 0 2 0 2 0 1 3 3 1 0 2;
            0 0 1 1 1 1 3 3 0 0 2 2 2 2 3 3;
            0 2 1 3 1 3 3 1 0 2 2 0 2 0 3 1;
            0 0 1 1 3 3 1 1 2 2 3 3 1 1 3 3;
            0 2 1 3 3 1 1 3 2 0 3 1 1 3 3 1;
            0 0 2 2 3 3 1 1 0 0 1 1 3 3 2 2;
            0 2 2 0 3 1 1 3 0 2 1 3 3 1 2 0;
            0 0 2 2 1 1 3 3 2 2 0 0 0 0 2 2;
            0 2 2 0 1 3 3 1 2 0 0 2 0 2 2 0;
            0 0 3 3 2 2 2 2 0 0 3 3 1 1 1 1;
            0 2 3 1 2 0 2 0 0 2 3 1 1 3 1 3;
            0 0 3 3 0 0 0 0 2 2 2 2 2 2 1 1;
            0 2 3 1 0 2 0 2 2 0 2 0 2 0 1 3;
        ];
    elseif isequal([M, Q, V], [16, 4, 3])
        H = [
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; % P. Lampio et al., https://wiki.aalto.fi/display/Butson/Butson+Home
            0 0 0 0 0 0 1 1 2 2 2 2 2 2 3 3; % defect = 0
            0 0 0 0 2 2 2 2 0 0 1 1 3 3 2 2; % BH-offset = 1742967
            0 0 0 2 0 2 2 3 1 3 3 3 1 1 1 2;
            0 0 2 1 3 3 0 2 2 1 0 3 2 3 1 1;
            0 1 2 2 3 1 0 1 0 3 0 2 0 2 2 3;
            0 1 2 3 0 2 3 0 0 2 2 1 2 3 0 1;
            0 1 3 3 2 3 2 1 3 1 2 3 0 1 1 0;
            0 2 0 2 2 3 1 3 1 2 0 1 3 2 0 0;
            0 2 1 0 2 2 1 0 3 2 0 3 1 0 3 2;
            0 2 1 3 3 1 0 2 2 0 2 0 3 1 0 2;
            0 2 3 1 1 0 3 3 3 0 1 2 1 2 0 2;
            0 2 3 1 3 1 2 0 2 0 3 1 2 0 2 0;
            0 3 1 2 1 3 0 2 3 3 2 1 1 0 2 0;
            0 3 2 0 1 1 3 3 1 2 1 3 3 1 2 0;
            0 3 2 2 1 0 2 1 1 1 3 0 0 3 3 2;
        ];
    elseif isequal([M, Q, V], [16, 8, 1])
        H = [
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 4 0 4 0 4 0 4 0 4 0 4 0 4 0 4;
            0 0 1 1 2 2 3 3 4 4 5 5 6 6 7 7;
            0 4 1 5 2 6 3 7 4 0 5 1 6 2 7 3;
            0 0 2 2 4 4 6 6 0 0 2 2 4 4 6 6;
            0 4 2 6 4 0 6 2 0 4 2 6 4 0 6 2;
            0 0 3 3 6 6 1 1 4 4 7 7 2 2 5 5;
            0 4 3 7 6 2 1 5 4 0 7 3 2 6 5 1;
            0 0 4 4 0 0 4 4 0 0 4 4 0 0 4 4;
            0 4 4 0 0 4 4 0 0 4 4 0 0 4 4 0;
            0 0 5 5 2 2 7 7 4 4 1 1 6 6 3 3;
            0 4 5 1 2 6 7 3 4 0 1 5 6 2 3 7;
            0 0 6 6 4 4 2 2 0 0 6 6 4 4 2 2;
            0 4 6 2 4 0 2 6 0 4 6 2 4 0 2 6;
            0 0 7 7 6 6 5 5 4 4 3 3 2 2 1 1;
            0 4 7 3 6 2 5 1 4 0 3 7 2 6 1 5;
        ];
    elseif isequal([M, Q, V], [16, 8, 2])
        H = [
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 4 6 2 7 3 5 1 0 4 6 2 0 4 6 2;
            0 0 4 4 6 6 2 2 0 0 4 4 0 0 4 4;
            0 4 2 6 5 1 7 3 0 4 2 6 0 4 2 6;
            0 0 0 0 4 4 4 4 5 0 0 0 1 4 4 4;
            0 4 6 2 3 7 1 5 5 4 6 2 1 0 2 6;
            0 0 4 4 2 2 6 6 5 0 4 4 1 4 0 0;
            0 4 2 6 1 5 3 7 5 4 2 6 1 0 6 2;
            0 0 0 6 0 0 0 0 4 4 4 2 4 4 4 4;
            0 4 6 0 7 3 5 1 4 0 2 4 4 0 2 6;
            0 0 4 2 6 6 2 2 4 4 0 6 4 4 0 0;
            0 4 2 4 5 1 7 3 4 0 6 0 4 0 6 2;
            0 0 0 6 4 4 4 4 1 4 4 2 5 0 0 0;
            0 4 6 0 3 7 1 5 1 0 2 4 5 4 6 2;
            0 0 4 2 2 2 6 6 1 4 0 6 5 0 4 4;
            0 4 2 4 1 5 3 7 1 0 6 0 5 4 2 6;
        ];
    elseif isequal([M, Q], [21, 3])
        H = [
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; % P. Lampio et al., https://wiki.aalto.fi/display/Butson/Butson+Home
            0 0 0 0 0 0 0 1 1 1 1 1 1 1 2 2 2 2 2 2 2; % defect = 0
            0 0 0 0 0 1 1 0 0 2 2 2 2 2 1 1 1 1 1 2 2; % BH-offset = 61
            0 0 0 1 1 0 2 2 2 0 0 1 2 2 0 1 1 2 2 1 1;
            0 0 0 1 2 2 2 1 2 1 2 2 0 1 1 0 2 0 1 0 1;
            0 0 1 2 1 2 2 0 1 2 2 1 1 0 0 0 2 1 0 1 2;
            0 0 2 2 1 1 1 1 2 2 0 0 1 0 1 2 0 0 2 2 1;
            0 1 0 2 2 0 1 2 1 0 2 2 1 0 2 2 1 0 1 1 0;
            0 1 1 0 2 2 0 0 2 2 1 0 1 2 0 2 1 2 1 0 1;
            0 1 2 0 0 2 1 2 2 1 0 1 0 2 1 2 2 1 0 1 0;
            0 1 2 1 0 2 2 2 1 1 1 0 2 0 0 1 0 0 1 2 2;
            0 1 2 1 2 1 0 0 1 0 2 1 0 2 2 0 0 1 2 2 1;
            0 1 2 2 0 1 2 1 0 2 1 2 0 1 0 0 1 2 2 1 0;
            0 1 2 2 1 0 1 0 0 1 2 0 2 1 2 1 2 2 0 0 1;
            0 2 0 1 2 1 0 1 2 2 1 0 2 0 2 1 2 1 0 1 0;
            0 2 1 0 1 2 1 0 2 0 1 2 0 1 2 1 0 0 2 1 2;
            0 2 1 0 2 1 2 2 0 1 2 1 1 0 1 1 0 2 2 0 0;
            0 2 1 1 2 0 1 2 1 2 0 0 0 1 1 0 1 2 0 2 2;
            0 2 1 2 0 0 2 1 1 0 1 2 2 2 1 2 0 1 0 0 1;
            0 2 1 2 1 2 0 1 0 1 0 1 2 2 2 0 1 0 1 2 0;
            0 2 2 1 1 1 0 2 0 0 0 2 1 1 0 2 2 1 1 0 2;
        ];
    else
        error('Not supported!');
    end

    H = exp(2j * pi * H / Q);

end
