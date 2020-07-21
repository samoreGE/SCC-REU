function y = y (n)
% This function calculates matrices Y of theorem 2.6
y = zeros (n,n-1);
for k = 1:n-1
 y (1:k,k)=ones (k,1);
 y (k + 1,k)=-k;
end