function [prefsOrder] = prefsOrder(aggWeight)
%ORDERPREFS Summary of this function goes here
%   Detailed explanation goes here
for x = 1:size(aggWeight)
    currentMax = find(aggWeight == max(aggWeight));
    prefPick=randi(length(currentMax));
    prefsOrder(x) = currentMax(prefPick);
    aggWeight(currentMax(prefPick))= -1;
end
end