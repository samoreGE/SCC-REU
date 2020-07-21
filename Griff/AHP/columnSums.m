function [columnSums] = columnSums(A)
%Finds the sum of values in a column
%   Detailed explanation goes here
x = 0;
for i1  = 1:size(A,1)
    for i2  = 1:size(A,1)
        a = x + A(i2, i1);
        x = a;
    end
    columnSums(i1) = x;
    x = 0;
end

