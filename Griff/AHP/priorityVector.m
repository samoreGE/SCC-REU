function [priorityVector] = priorityVector(A)
%GET Summary of this function goes here
%   Detailed explanation goes here
x = 0;
sums = columnSums(A);
for i1  = 1:size(A,1)
    for i2  = 1:size(A,1)
        B(i1, i2) = A(i1, i2)/sums(i2);
    end
end
for i1  = 1:size(B,1)
    sum = 0;
    for i2  = 1:size(B,1)
        sum = sum+ B(i1, i2);
    end
    priorityVector(i1,1) = sum/size(B,1);
end