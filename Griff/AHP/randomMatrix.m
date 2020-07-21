function [randomMatrix] = randomMatrix(n)
%Makes a random, non-normalized matrix
A = zeros(n);
for row=1:size(A,1)
    for col=1:size(A,2)
        if row == col
            A(row,col) = 1;
        elseif col > row
            continue
        else
            r = randi([1,9]);
            A(row,col) = r;
            A(col,row) = 1/r;
        end
    end
end
randomMatrix = A;
end

