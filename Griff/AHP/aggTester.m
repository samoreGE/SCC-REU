function [taskScores,  workerScores] = aggTester(members, maxOffset)


generator = Generator;

roster = Roster(generator, members);

randNegOffScores = [];
mutualNegOffScores = [];
randPosOffScores = [];
mutualPosOffScores = [];
firstserveNegScores = [];
firstservePosScores = [];

for y = 0:maxOffset
    [negOffTasks, negOffWorkers] = makeCast(roster,members, -y);
    debug = "doNeg TESTS";
    [randNegPairs,randNegRanks,mutualNegPairs,mutualNegRanks,firstserveNegPairs,firstserveNegRanks] = doTests(negOffTasks, negOffWorkers);
    debug = "randNeg SCORE";
    [randNegOffScores(y+1, 1), randNegOffScores(y+1, 2)] = scorePairs(roster, randNegPairs, randNegRanks, -y);
    debug = "firstserveNeg SCORE";
    [firstserveNegScores(y+1, 1), firstserveNegScores(y+1, 2)] = scorePairs(roster, firstserveNegPairs, firstserveNegRanks, -y);
    debug = "mutualNeg SCORE";
    [mutualNegOffScores(y+1, 1), mutualNegOffScores(y+1, 2)] = scorePairs(roster, mutualNegPairs, mutualNegRanks, -y);
    
    
    [posOffTasks, posOffWorkers] = makeCast(roster,members, y);
    debug = "doPos TESTS";
    [randPosPairs,randPosRanks,mutualPosPairs,mutualPosRanks,firstservePosPairs,firstservePosRanks] = doTests(posOffTasks, posOffWorkers);
    debug = "randPos SCORE";
    [randPosOffScores(y+1, 1), randPosOffScores(y+1, 2)] = scorePairs(roster, randPosPairs, randPosRanks, y);
    debug = "firstservePos SCORE";
    [firstservePosScores(y+1, 1), firstservePosScores(y+1, 2)] = scorePairs(roster, firstservePosPairs,firstservePosRanks, y);
    debug = "mutualPos SCORE";
    [mutualPosOffScores(y+1, 1), mutualPosOffScores(y+1, 2)] = scorePairs(roster, mutualPosPairs, mutualPosRanks, y);
end
%randNegOffScores
%mutualNegOffScores
%randPosOffScores
%mutualPosOffScores
[taskScores,  workerScores] = combineScores(randNegOffScores, firstserveNegScores, mutualNegOffScores, randPosOffScores, firstservePosScores, mutualPosOffScores);
end

function [taskScores,  workerScores] = combineScores(randNeg, firstserveNeg, mutualNeg, randPos, firstservePos, mutualPos)
%randNeg
%firstserveNeg
%mutualNeg
%randPos
%firstservePos
%mutualPos
arraysLength = length(randNeg);
for x = 1:arraysLength
    negSpot = arraysLength+1-x;
    posSpot = arraysLength+x-1;
    taskScores(negSpot, 1) = randNeg(x, 1);
    taskScores(posSpot, 1) = randPos(x, 1);
    workerScores(negSpot, 1) = randNeg(x, 2);
    workerScores(posSpot, 1) = randPos(x, 2);
    taskScores(negSpot, 2) = firstserveNeg(x, 1);
    taskScores(posSpot, 2) = firstservePos(x, 1);
    workerScores(negSpot, 2) = firstserveNeg(x, 2);
    workerScores(posSpot, 2) = firstservePos(x, 2);
    taskScores(negSpot, 3) = mutualNeg(x, 1);
    taskScores(posSpot, 3) = mutualPos(x, 1);
    workerScores(negSpot, 3) = mutualNeg(x, 2);
    workerScores(posSpot, 3) = mutualPos(x, 2);
    
end
end

function [randomPairs, randomRanks, mutualPairs, mutualRanks, firstservePairs, firstserveRanks] = doTests(tasks, workers)
[randomPairs, randomRanks] = randomMatcher(tasks, workers);
[mutualPairs, mutualRanks] = mutualMatcher(tasks, workers);
[firstservePairs, firstserveRanks] = firstserveMatcher(tasks, workers);
end