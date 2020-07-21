function productRanker = productRanker(qualities, subQualities, products)
%Randomly makes ranked products via AHP

%Generates a product with a random number of qualities, randomly assigns 
%relative importance to qualities and sub-qualities, and generates
%instances of that product, comparing them via AHP

% Determine where your m-file's folder is.
folder = fileparts(which('productRanker.m')); 
% Add that folder plus all subfolders to the path.
addpath(genpath(folder));

qualWeights = priorityVector(normalizeMatrix(randomMatrix(qualities)));

for i1  = 1:qualities
    x = priorityVector(normalizeMatrix(randomMatrix(subQualities)));
    for i2  = 1:subQualities
        subQualWeights(i2, i1) = x(i2);
    end
end

for x = 1:products
    for y = 1:qualities
        z = randi(subQualities);
        randPicks(x, y) = z;
        productPicks(x, y) = subQualWeights(z, y) * qualWeights(y);
    end
end

for x = 1:products
    sum = 0;
    for y = 1:qualities
        sum = sum +productPicks(x,y);
    end
    productWeights(x,1) = sum;
end

productWeights

productRanker = prefsOrder(productWeights);

end

