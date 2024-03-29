function Y = TU_16_17_146B(p)
% ------------------------------------------------------------------------------
% 2022-12-30 Wojciech Bruzda; name[at]uj.edu.pl : name = w.bruzda
%            https://chaos.if.uj.edu.pl/~karol/hadamard/
%            https://github.com/matrix-toolbox/
% ------------------------------------------------------------------------------
% A 4-parametric 2-unitary CHM(16)... Probably equivalent to TU_16_17_146A(p).
% ------------------------------------------------------------------------------

    a = exp(2j*pi*p(1));
    b = exp(2j*pi*p(2));
    c = exp(2j*pi*p(3));
    d = exp(2j*pi*p(4));

    A = a*b;
    B = c/b;
    C = -a*b*B;
    D = a*c/b;
    E = d/a;
    F = d*b;
    G = -c*d/b;
    H = G*b;
    K = a*d*b;

    Y = [
        1 ,  1 ,  1 ,  1  ,  1 ,  1  ,  1 ,  1 ,  1 ,  1 ,  1  ,  1  ,  1  ,  1 ,  1 ,  1;
        1 ,  A ,  B , -B  , -A , -1  ,  C , -C ,  A ,  1 , -B  ,  B  , -1  , -A , -C ,  C;
        1 ,  a , -B ,  D  ,  A ,  b  ,  C ,  c , -a , -1 , -D  ,  B  , -b  , -A , -c , -C;
        1 , -a , -1 ,  b' , -1 ,  a' ,  1 , -b ,  a , -1 , -b' ,  1  , -a' ,  1 ,  b , -1;
        1 ,  d , -d , -d  ,  d ,  1  , -1 , -1 ,  d ,  1 , -d  , -d  ,  1  ,  d , -1 , -1;
        1 ,  K ,  G , -G  , -K , -1  , -C ,  C ,  K ,  1 , -G  ,  G  , -1  , -K ,  C , -C;
        1 ,  a , -G , -D  ,  K ,  F  , -C ,  H , -a , -1 ,  D  ,  G  , -F  , -K , -H ,  C;
        1 , -a ,  d , -b' , -d ,  E  , -1 ,  F ,  a , -1 ,  b' , -d  , -E  ,  d , -F ,  1;
        1 , -1 , -1 , -1  , -1 ,  1  ,  1 ,  1 , -1 ,  1 , -1  , -1  ,  1  , -1 ,  1 ,  1;
        1 , -A , -B ,  B  ,  A , -1  ,  C , -C , -A ,  1 ,  B  , -B  , -1  ,  A , -C ,  C;
        1 ,  a ,  B ,  D  , -A , -b  ,  C , -c , -a , -1 , -D  , -B  ,  b  ,  A ,  c , -C;
        1 , -a ,  1 ,  b' ,  1 , -a' ,  1 ,  b ,  a , -1 , -b' , -1  ,  a' , -1 , -b , -1;
        1 , -d ,  d ,  d  , -d ,  1  , -1 , -1 , -d ,  1 ,  d  ,  d  ,  1  , -d , -1 , -1;
        1 , -K , -G ,  G  ,  K , -1  , -C ,  C , -K ,  1 ,  G  , -G  , -1  ,  K ,  C , -C;
        1 ,  a ,  G , -D  , -K , -F  , -C , -H , -a , -1 ,  D  , -G  ,  F  ,  K ,  H ,  C;
        1 , -a , -d , -b' ,  d , -E  , -1 , -F ,  a , -1 ,  b' ,  d  ,  E  , -d ,  F ,  1;
    ];

    DL = diag([1,1,1,1,1,-1, -1,1,1,1,1,1,1,-1,-1,1]);
    DR = diag([1,1,1,1,1,a^2,a/b,a/b,1/a,-a,1,-1,b,-b,1,-1]);
    Y = DL * Y * DR;

end

