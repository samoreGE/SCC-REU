function aggTester = aggTester()
clc

% Determine where your m-file's folder is.
folder = fileparts(which('aggTester.m')); 
% Add that folder plus all subfolders to the path.
addpath(genpath(folder));

rng(1);

maxMembers = 5  %MUST BE GREATER THAN ONE (please)
maxOffset = 4

generator = Generator;

roster = Roster(generator, maxMembers);

randNegOffScores = [];
mutualNegOffScores = [];
randPosOffScores = [];
mutualPosOffScores = [];
for y = 0:maxOffset
    [negOffTasks, negOffWorkers] = makeCast(roster,maxMembers, -y);
    debug = "doNeg TESTS";
    [randNegPairs, randNegRanks, mutualNegPairs, mutualNegRanks] = doTests(negOffTasks, negOffWorkers);
    debug = "randNeg TEST";
    [randNegOffScores(y+1, 1), randNegOffScores(y+1, 2)] = scorePairs(roster, randNegPairs, randNegRanks, -y);
    debug = "mutualNeg TEST";
    [mutualNegOffScores(y+1, 1), mutualNegOffScores(y+1, 2)] = scorePairs(roster, mutualNegPairs, mutualNegRanks, -y);
    
    [posOffTasks, posOffWorkers] = makeCast(roster,maxMembers, y);
    debug = "doPos TESTS";
    [randPosPairs, randPosRanks ,mutualPosPairs, mutualPosRanks] = doTests(posOffTasks, posOffWorkers);
    debug = "randPos SCORE";
    [randPosOffScores(y+1, 1), randPosOffScores(y+1, 2)] = scorePairs(roster, randPosPairs, randPosRanks, y);
    debug = "mutualPos SCORE";
    [mutualPosOffScores(y+1, 1), mutualPosOffScores(y+1, 2)] = scorePairs(roster, mutualPosPairs, mutualPosRanks, y);
end
randNegOffScores
mutualNegOffScores
randPosOffScores
mutualPosOffScores
[randScores,  mutualScore] = combineScores(randNegOffScores, mutualNegOffScores, randPosOffScores, mutualPosOffScores)

plot(mutualScore)

end

function [randScores,  mutualScore] = combineScores(randNeg, mutualNeg, randPos, mutualPos)
arraysLength = length(randNeg)
for x = 1:arraysLength
    negSpot = arraysLength+1-x
    posSpot = arraysLength+x-1
    randScores(negSpot, 1) = randNeg(x, 1);
    randScores(posSpot, 1) = randPos(x, 1);
    randScores(negSpot, 2) = randNeg(x, 2);
    randScores(posSpot, 2) = randPos(x, 2);
    mutualScore(negSpot, 1) = mutualNeg(x, 1);
    mutualScore(posSpot, 1) = mutualPos(x, 1);
    mutualScore(negSpot, 2) = mutualNeg(x, 2);
    mutualScore(posSpot, 2) = mutualPos(x, 2);
    
end
end

function [randomPairs, randomRanks, mutualPairs, mutualRanks] = doTests(tasks, workers)
[randomPairs, randomRanks] = randomMatcher(tasks, workers);
[mutualPairs, mutualRanks] = mutualMatcher(tasks, workers);
end