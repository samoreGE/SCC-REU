function [mutualPairs, mutualRanks] = mutualMatcher(pickers, targets)
taskPrefs = makeRanks(pickers, targets, length(pickers), length(targets));
workerPrefs = makeRanks(targets, pickers, length(targets), length(pickers));
mutualPairs = SMP(taskPrefs, workerPrefs);
for x = 1:length(mutualPairs)
    mutualRanks(x, 1) = find(taskPrefs(x, 1:length(taskPrefs))==mutualPairs(x,1));
    mutualRanks(x, 2) = find(workerPrefs(x, 1:length(workerPrefs))==mutualPairs(x,2));
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