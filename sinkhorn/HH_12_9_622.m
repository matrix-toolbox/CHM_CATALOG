function [iiMax, nP, ZTolerance, YPattern, muFactor] = HH_12_9_622()
% ------------------------------------------------------------------------------
% 2023-01-23 Wojciech Bruzda; name[at]uj.edu.pl : name = w.bruzda
%            https://chaos.if.uj.edu.pl/~karol/hadamard/
%            https://github.com/matrix-toolbox/
% ------------------------------------------------------------------------------
% Hermitian CHM of size N = 12 with generic d = 9 and #L = 622.
% Found as a solution of "HH_12_5_1902.m" and defined as a separate pattern.
% ------------------------------------------------------------------------------
% Very slow convergence only for particular starting points.
% Example of solution:
%
%  p1 = -0.427278279902011 - 0.904120164316657i
%  p2 = -0.818733750689318 + 0.574173358387692i
%  p3 = +0.891065214927442 + 0.453875294267392i
%  p4 = +0.296471334822937 + 0.955041751772301i
%  p5 = +0.862937121652687 + 0.505311314017187i
%  p6 = +0.228210380821559 + 0.973611843644724i
%  p7 = -0.021146041090959 + 0.999776397474045i
%  p8 = -0.999716002880129 + 0.023830937568175i
%  p9 = +0.867839701279580 + 0.496844294405168i
% p10 = +0.539611884740910 + 0.841913899307027i
% p11 = -0.719712449347694 - 0.694272273862310i
% p12 = -0.999689207599644 - 0.024929665236323i
% p13 = +0.846343191196332 - 0.532637965897671i
% p14 = +0.461634113215001 + 0.887070428723785i
% p15 = -0.016780956014586 + 0.999859189843868i
% p16 = -0.053094369739921 - 0.998589499194699i
% p17 = -0.539518321851691 + 0.841973859681127i
% p18 = -0.848375054778702 - 0.529395661513422i
% p19 = -0.562407395240920 - 0.826860279477932i
% p20 = +0.881679487652028 - 0.471848790454800i
% p21 = +0.909218920533686 - 0.416318333182144i
% p22 = +0.398158557241798 + 0.917316610170736i
% p23 = -0.265377412615456 + 0.964144609938533i
% p24 = -0.461255445967587 - 0.887267385608894i
% p25 = -0.934292231664551 + 0.356508100681139i
% p26 = +0.960538006024625 - 0.278148771311751i
% p27 = -0.988010369632627 + 0.154387530255522i
% p28 = -0.669146844811608 - 0.743130203987612i
% p29 = -0.729679041391798 + 0.683789804365016i
% p30 = -0.942381243649663 - 0.334540866886714i
% p31 = +0.463262788299403 + 0.886220959454843i
% p32 = -0.796113863768570 - 0.605146854833998i
% p33 = +0.378128815170519 - 0.925752990347717i
% p34 = +0.975186769120347 + 0.221383751284099i
% ------------------------------------------------------------------------------


    iiMax = 40000;
    nP = 34; % number of phases
    ZTolerance =  5e-13;
    YPattern = @pattern;
    muFactor = 0.0003;
end

function Y = pattern(p)
    Y = [
        1    1       1       1        1       1        1       1        1       1       1         1      ;
        1    1       p(1)'   p(2)'    p(3)'   p(4)    -p(5)'   p(6)'   -p(7)'   p(8)'   -p(9)     p(10)' ;
        1    p(1)    1       p(11)    p(4)    p(12)    p(13)   p(14)    p(15)   p(16)    p(17)    p(18)  ;
        1    p(2)    p(11)'  1        p(19)   p(1)     p(20)   p(21)    p(22)   p(23)    p(24)    p(25)  ;
        1    p(3)    p(4)'   p(19)'   1       p(11)    p(26)   p(27)    p(28)   p(29)    p(30)    p(31)  ;
        1    p(4)'   p(12)'  p(1)'    p(11)'  1        p(17)'  p(18)'   p(13)'  p(14)'   p(15)'   p(16)' ;
        1   -p(5)    p(13)'  p(20)'   p(26)'  p(17)   -1      -p(20)'  -p(13)'  p(5)    -p(17)   -p(26)' ;
        1    p(6)    p(14)'  p(21)'   p(27)'  p(18)   -p(20)  -1       -p(28)   p(32)    p(9)     p(33)  ;
        1   -p(7)    p(15)'  p(22)'   p(28)'  p(13)   -p(13)  -p(28)'  -1      -p(22)'  -p(15)'   p(7)   ;
        1    p(8)    p(16)'  p(23)'   p(29)'  p(14)    p(5)'   p(32)'  -p(22)  -1       -p(30)    p(34)  ;
        1   -p(9)'   p(17)'  p(24)'   p(30)'  p(15)   -p(17)'  p(9)'   -p(15)  -p(30)'  -1       -p(24)' ;
        1    p(10)   p(18)'  p(25)'   p(31)'  p(16)   -p(26)   p(33)'   p(7)'   p(34)'  -p(24)   -1      ;
    ];
end
