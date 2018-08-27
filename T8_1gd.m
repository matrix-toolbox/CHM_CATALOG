function T8_1gd(gstep)
% 20171218
% 20180301
%
% W. Bruzda, name[at]uj.edu.pl : name = w.bruzda
% http://chaos.if.uj.edu.pl/~karol/hadamard/
% https://github.com/matrix-toolbox/
%
% defect of T8_1(gamma)
%
% >> T8_1gd(0.001)

  if ~exist('defect')
      error('defect is undefined! please locate ''defect'' scripts to continue!');
  end

  global dTable = [];

  for gamma = 2/5 : gstep : 4/5, getDef(gamma), end
  for gamma = 1 : gstep : 14/10, getDef(gamma), end
 
  disp(sprintf('defects found: %s', num2str(sort(dTable))));

end

function getDef(g)
  global dTable;

  d = defect(T8_1(g));
  if ~any(dTable == d)
    dTable = [dTable d]; % append to dArray if unique
  end
  if d ~= 3 % skip generic defect (3) of T8_1
      disp(sprintf('defect=%d \tfor gamma=%g', d, g));
  end
end

