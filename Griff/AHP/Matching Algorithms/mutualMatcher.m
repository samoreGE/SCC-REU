function mutualMatcher = mutualMatcher(pickers, targets)
    taskPrefs = makeRanks(pickers, targets, length(pickers), length(targets));
    workerPrefs = makeRanks(targets, pickers, length(targets), length(pickers));
    mutualMatcher = SMP(taskPrefs, workerPrefs);
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