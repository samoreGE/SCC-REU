function [pairs] = findPartner(pref1, pref2, pairs, subject)
%FINDPARTNER Summary of this function goes here
%   Detailed explanation goes here
partnerFound = false;
for index = 1:size(pref1) 
    nextProp = pref1(subject, index);
    if ~partnerFound
        oldMatch = pairs(nextProp, 2);
        if oldMatch == 0
            partnerFound = true;
            pairs(subject, 1) = nextProp;
            pairs(nextProp, 2) = subject;
        else
            for y = 1:size(pref1)
                if pref2(nextProp, y) == oldMatch
                    oldLoc = y;
                end
                if pref2(nextProp, y) == subject
                    subjLoc = y;
                end
            end
            if subjLoc < oldLoc
                pairs(oldMatch, 1) = 0;
                partnerFound = true;
                pairs(subject, 1) = nextProp;
                pairs(nextProp, 2) = subject;
            end
        end
    end
end
