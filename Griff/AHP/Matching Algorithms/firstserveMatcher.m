function [firstservePairs, firstserveRanks] = firstserveMatcher(pickers, targets)
taskPrefs = makeRanks(pickers, targets, length(pickers), length(targets));
workerPrefs = makeRanks(targets, pickers, length(targets), length(pickers));
firstservePairs = zeros(length(pickers), 2);
for x = 1:length(pickers)
    nextViable = 1;
    pick = taskPrefs(x, nextViable);
    while isTaken(firstservePairs, pick)
        nextViable = nextViable + 1;
        pick = taskPrefs(x, nextViable);
    end
    firstservePairs(x,1) = pick;
    firstservePairs(pick, 2) = x;
end
for x = 1:length(firstservePairs)
    firstserveRanks(x, 1) = find(taskPrefs(x, 1:length(taskPrefs))==firstservePairs(x,1));
    firstserveRanks(x, 2) = find(workerPrefs(x, 1:length(workerPrefs))==firstservePairs(x,2));
end
end

function isTaken = isTaken(pairs, toCheck)
    isTaken = false;
    for x = 1:length(pairs)
        if toCheck == pairs(x, 1)
            isTaken = true;
        end
    end
end

function makeRanks = makeRanks(pickers, targets, pickersAmnt, targetsAmnt)
for x = 1:pickersAmnt
    ranker = pickers(x);
    rankedSubjects = rankByPrefs(ranker, targets, targetsAmnt);
    for y = 1:targetsAmnt
        makeRanks(x,y) = rankedSubjects(y);
    end
end
end