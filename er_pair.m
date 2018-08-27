function er_pair(H)
% 20171212
% seek for ER rows (columns) of a CHM matrix
%
% call:
% >> H = fourier(4)
% >> er_pair(H)
%
% details:
%   D. Goyeneche, A new method to construct families of CHM in even dimensions
%   https://arxiv.org/abs/1210.7673
%   Def. III.1
%   Let CA and CB be two columns [rows] of a CHM. THey are ER iff abs(real(CA*(j).CB(j)))=1 for any j.
%
%   Thm. III.1
%   Let H be a CHM defined in an even dimension d > 2. if H has m < d / 2 ER pairs
%   then H belongs to a m-dim. family.

for r1=1:size(H, 1)-1
    for r2=r1+1:size(H, 1)
        ER = true;
        for j=1:size(H, 1)
            if abs(abs(real(H(r1, j)'*H(r2,j))) - 1) >= 1e-8
                ER = false;
            end
        end
        if ER == true
            disp(sprintf('r1 = %d \t r2 = %d', r1, r2));
        end
    end
end

end

% dephasing BH(N,q)
% for c=1:N, w = mod(q - H(1,c), q);
% for r=1:N, H(r,c) = mod(H(r,c) + w, q);
% end, end

