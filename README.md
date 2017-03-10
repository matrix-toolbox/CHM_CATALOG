# chm

Set of Matlab and Mathematica scripts supporting the [catalogue](http://chaos.if.uj.edu.pl/~karol/hadamard/) of complex Hadamard matrices. Scripts were prepared and tested in:
```
9.1.0.441655 (R2016b) % Matlab
10.1 (* Mathematica *)
```
respectively. Matlab scripts should also be runnable in Octave environment.

## nomenclature (Matlab)

Script names follow the convention proposed in the [catalogue](http://chaos.if.uj.edu.pl/~karol/hadamard/?q=theory#notation). In particular:
- matrix name format is `XN_M`, `XNS_M` or `XN_M_SIGMA` where
  - `X` = symbol denoting the matrix (usually it is the first letter of author's name)
  - `N` = size of the matrix
  - `S` = additional symbol to distinguish between two or more matrices of given size
  - `M` = number of parameters (0 if matrix is an isolated point)
  - `SIGMA` is additional parametrisation
- if matrix admits a **family** stemming from it, the appropriate vector (matrix) of parameters (free phases) is denoted by `R_XN`, where `X` and `N` have aforementioned interpretation
  - for **affine families** a vector of free phases can be passed as a parameter, otherwise default zero (vector) value is used - free phases are normalized to unit interval: [0, 2&pi;) &rarr; [0, 1)
  - for **non-affine families** it might happen that a special restriction for free phases should be imposed - see for example `B6_1.m` or `M6_1.m`

## usage (Matlab)
```
>> H = F6_2             % six-dimensional Fourier with default (zero) phases
>> H = F6_2(rand(1, 2)) % random phases
>> H = F6_2([0.5 0])    % custom phases, here: pi/2 (normalization!) and 0

>> H = Q11_0_SIGMA(1)   % one of two possible realisations of Q11 matrix (which is isolated)
```
