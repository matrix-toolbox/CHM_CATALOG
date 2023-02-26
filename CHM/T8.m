function H = T8(p)
% ------------------------------------------------------------------------------
% 2018-01-06 WB
% 2018-02-24 Wojciech Bruzda; name[at]uj.edu.pl : name = w.bruzda
%            https://chaos.if.uj.edu.pl/~karol/hadamard/
%            https://github.com/matrix-toolbox/
% ------------------------------------------------------------------------------
% A 1-parametric non-affine family of CHM of order N = 8;
% * generic defect=3
% * p = 1/2, 1, 13/10  =>  defect=7  and T in BH(8, 20)
% * p = 4/5            =>  defect=11 and T in BH(8, 20)
%
% >> H = T8_1(rand)
% ------------------------------------------------------------------------------

  g1 = 0.38629047387009;           % check: p = phase of x
  g2 = 0.8301134750001507;
  g3 = 0.9700212764097545;
  g4 = 1.413709525400110;
  if ~((p > g1 && p < g2) || (p > g3 && p < g4))
     warning("Wrong parameter! Continue with random (and valid) value...")
     u1 = rand;
     u2 = rand;
     u3 = fix(rand*2);
     r1 = u1 * g2 - (u1 - 1) * g1; % 1st interval
     r2 = u2 * g4 - (u2 - 1) * g3; % 2nd interval
     p = u3 * r1 + (1 - u3) * r2;
  end

  x = exp(i*pi*p);                 % free parameter

  s5=sqrt(5);                      % constants
  s2=sqrt(2);
  zeta1 = -i*sqrt(10-2*s5);
  zeta2 = +i*sqrt(10-2*s5);
  zeta4 = +i*sqrt(10+2*s5);
  
  x1 = 5 - 3*s5 + 4*sqrt(5-2*s5) + (1+i)/x + zeta2;
  x2 = 45-9 * i-(17-7*i)*s5 - 2*sqrt(620-500*i-(285-234*i)*s5) - (1+i)*x1/x;
  x3 = 10*i - 10 + (6+-2*i)*s5 + 4*sqrt(10-10*i-(5-4*i)*s5) + (1+i)*x2/x;
  x4 = s5 - 1 + i*s2*sqrt(5+s5) + (1+i)*x3/x;
  x5 = (1+i)*sqrt(1-s5+zeta4) - (1-i)*(2*x^2+sqrt(x4)') - x*(1-4*i+s5+zeta1);
  x6 = s5 - 1 - i - sqrt(5-2*s5) + (1-i)*x;
  y = x5 / x6 / 4;
  z = x * ((1+i)*exp(i*pi*4/5) - x - y - 1 + i) / (x-y);


%  q = (1/2)*(exp(i*pi/5) + exp(i*pi*7/10) - 1 + i)*(1/x-1/y)^(-1) + ...
%      (1/2)*(1/x-1/y)^(-2)*sqrt((1/x-1/y)^2*(i-1)*(2*exp(i*pi/5)+2*exp(i*pi*7/10) + ...
%      (1+s5+4*i+zeta2)*(1/x+1/y) + (1+i)*(2*(1/x+1/y)^2-exp(i*pi*9/10)+i)));
  q = -i*x/z;
  u = (q/x) * (z*x-x*y-y*z-x^2)/(1+i-exp(i*pi*3/10)-exp(i*pi*4/5));

  assert(abs(abs(y) - 1.0) < 1e-13)
  assert(abs(abs(z) - 1.0) < 1e-13)
  assert(abs(abs(u) - 1.0) < 1e-13)

  T = [
    0 0 0 0 0  0  0  0;
    0 0 0 0 0  3 15 18;
    0 8 8 8 8 13 15  8;
    0 2 2 2 2 17  5  2;
    0 0 0 0 0  7  5 12;
    0 0 0 0 0  0 10 10;
    0 0 0 0 0 10  0 10;
    0 0 0 0 0 10 10  0;
  ] / 10;

  H = exp(i * pi * T) .* [
    1    1    1           1           1 1 1 1;
    1    x    y           z      -y*z/x 1 1 1;
    1 -u/y  u/x u*x/q/q/y/z     u/q/q/z 1 1 1;
    1    y    x      -y*z/x           z 1 1 1;
    1  u/x -u/y     u/q/q/z u*x/q/q/y/z 1 1 1;
    1    q   -q        -1/q         1/q 1 1 1;
    1    u   -u       u/q/q      -u/q/q 1 1 1;
    1  u/q  u/q        -u/q        -u/q 1 1 1;
  ];

end
