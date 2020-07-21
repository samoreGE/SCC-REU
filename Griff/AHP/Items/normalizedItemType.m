function [normalizedItemType] = normalizedItemType(subqualityNums)
%Makes a normalized item type with random preference weights
%   Detailed explanation goes here

numQualities = size(subqualityNums)
qualityPriorities = normalizeMatrix(randomMatrix(numQualities(2)))

for x=1:numQualities
    x
    subqualityPriorities {x,:} = normalizeMatrix(randomMatrix(subqualityNums(x)))
end

