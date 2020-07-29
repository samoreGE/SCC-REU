function [randomPairs, randomRanks] = randomMatcher(pickers, targets)
x = randperm(length(pickers));
y = randperm(length(targets));
taskPrefs = makeRanks(pickers, targets, length(pickers), length(targets));
workerPrefs = makeRanks(targets, pickers, length(targets), length(pickers));
for z = 1:length(x)
    randomPairs(z,1)=x(z);
    randomPairs(z,2)=y(z);
end
for x = 1:length(randomPairs)
    randomRanks(x, 1) = find(taskPrefs(x, 1:length(taskPrefs))==randomPairs(x,1));
    randomRanks(x, 2) = find(workerPrefs(x, 1:length(workerPrefs))==randomPairs(x,2));
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

