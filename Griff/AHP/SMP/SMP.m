function [pairs] = SMP(pref1, pref2)
%SMP Summary of this function goes here
%   Detailed explanation goes here
if size(pref1) == size(pref2)
    for x = 1:size(pref1)
        pairs(x,1) = 0;
        pairs(x,2) = 0;
    end
    while freeSpot(pairs)>0
        pairs = findPartner(pref1, pref2, pairs, freeSpot(pairs));
    end
else
    error = "asymetrical preferences"
end
end