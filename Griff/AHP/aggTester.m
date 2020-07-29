function aggTester = aggTester()
clc

% Determine where your m-file's folder is.
folder = fileparts(which('aggTester.m')); 
% Add that folder plus all subfolders to the path.
addpath(genpath(folder));

rng(1);

maxMembers = 5  %MUST BE GREATER THAN ONE (please)

generator = Generator;

roster = Roster(generator, maxMembers);

randNegOffScores = [];
mutualNegOffScores = [];
randPosOffScores = [];
mutualPosOffScores = [];
for y = 0:maxMembers-1
    y
    [negOffTasks, negOffWorkers] = makeCast(roster,maxMembers, -y);
    debug = "doNeg TESTS"
    [randNegPairs, randNegRanks, mutualNegPairs, mutualNegRanks] = doTests(negOffTasks, negOffWorkers);
    debug = "randNeg TEST"
    [randNegOffScores(y+1, 1), randNegOffScores(y+1, 2)] = scorePairs(roster, randNegPairs, randNegRanks, -y);
    debug = "mutualNeg TEST"
    [mutualNegOffScores(y+1, 1), mutualNegOffScores(y+1, 2)] = scorePairs(roster, mutualNegPairs, mutualNegRanks, -y);
    
    [posOffTasks, posOffWorkers] = makeCast(roster,maxMembers, y);
    debug = "doPos TESTS"
    [randPosPairs, randPosRanks ,mutualPosPairs, mutualPosRanks] = doTests(posOffTasks, posOffWorkers);
    debug = "randPos SCORE"
    [randPosOffScores(y+1, 1), randPosOffScores(y+1, 2)] = scorePairs(roster, randPosPairs, randPosRanks, y);
    debug = "mutualPos SCORE"
    [mutualPosOffScores(y+1, 1), mutualPosOffScores(y+1, 2)] = scorePairs(roster, mutualPosPairs, mutualPosRanks, y);
end
randNegOffScores
mutualNegOffScores
randPosOffScores
mutualPosOffScores
end

function [randomPairs, randomRanks, mutualPairs, mutualRanks] = doTests(tasks, workers)
[randomPairs, randomRanks] = randomMatcher(tasks, workers);
[mutualPairs, mutualRanks] = mutualMatcher(tasks, workers);
end