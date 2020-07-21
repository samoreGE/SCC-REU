function [normalizeMatrix] = normalizeMatrix(A)



isNormal = consistency(A);

if (isNormal == 0)
    A = matrix(A);
end

normalizeMatrix = A;
end
