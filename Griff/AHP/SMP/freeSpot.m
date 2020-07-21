function freeSpot = freeSpot(pairs)
%HASFREE Summary of this function goes here
%   Detailed explanation goes here
freeSpot = 0;
for x = 1:size(pairs)
    pairs(x, 1);
    if pairs(x, 1) == 0 && freeSpot == 0
        freeSpot = x;
    end
end