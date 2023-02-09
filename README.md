# chm

Set of scripts supporting the [catalogue](http://chaos.if.uj.edu.pl/~karol/hadamard/) of complex Hadamard matrices. Scripts were prepared and tested in:
```
9.1.0.441655 (R2016b) % Matlab
7.2.0 % Octave
```
Matlab scripts should also be runnable in Octave environment.

## nomenclature (Matlab)

Script names follow the convention proposed in the [catalogue](http://chaos.if.uj.edu.pl/~karol/hadamard/?q=theory#notation).
However they are slightly simplified. In particular:
- matrix name format is `YN` or `YNX` where
  - `Y` = symbol denoting the matrix (usually it is the first letter of the name of the author/finder)
  - `N` = size of the matrix
  - `X` = additional letter to distinguish between two or more matrices of given size
- if matrix admits a **family** stemming from it, the appropriate vector (matrix) of parameters (free phases) is usually denoted by `R`
  - for **affine families** a vector of free phases can be passed as a parameter; in every case free phases are normalized to unit interval: [0, 2&pi;) &rarr; [0, 1)
  - for **non-affine families** it might happen that a special restriction for free phases should be imposed, e.g. `M6.m`

## usage (Matlab)
```
>> H = F6(rand(1, 2))  % six-dim. Fourier with random phases
>> H = F6([rand rand]) % equivalent call
>> H = F6([0.5 0])     % custom phases

>> H = Q11X(1)         % one of four possible solutions for Q11 matrix
```

Mathematica users can easily adapt Matlab scrips using a copy/paste procedure...
