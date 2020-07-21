function [consistency] = consistency (A)

RI = [0 0 0.58 0.90 1.12 1.24 1.32 1.41 1.45 1.49 1.51];
    
e = eig(A);
n = size(A,1);

CI = (e-n)/(n-1);

CR = CI/RI(n);

if (CR<0.1) 
    consistency = 1;
else
    consistency = 0;
end

end

