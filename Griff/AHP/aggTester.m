function aggTester = aggTester()
clc

% Determine where your m-file's folder is.
folder = fileparts(which('aggTester.m')); 
% Add that folder plus all subfolders to the path.
addpath(genpath(folder));

rng(1);

maxMembers = 10  %MUST BE GREATER THAN ONE (please)
testsPerRound = 20

generator = Generator;

roster = Roster(generator, maxMembers);

randNegOffScores = []
mutualNegOffScores = []

randPosOffScores = []
mutualPosOffScores = []


for y = 0:maxMembers-1
    [negOffTasks, negOffWorkers] = makeCast(roster,maxMembers, -y);
    [randNegPairs, mutualNegPairs] = doTests(negOffTasks, negOffWorkers);
    [randNegOffScores(y+1, 1), randNegOffScores(y+1, 2)] = scorePairs(roster, randNegPairs, -y)
    [mutualNegOffScores(y+1, 1), mutualNegOffScores(y+1, 2)] = scorePairs(roster, mutualNegPairs, -y)
    [posOffTasks, posOffWorkers] = makeCast(roster,maxMembers, y);
    [randPosPairs, mutualPosPairs] = doTests(posOffTasks, posOffWorkers);
    [randPosOffScores(y+1, 1), randPosOffScores(y+1, 2)] = scorePairs(roster, randPosPairs, y)
    [mutualPosOffScores(y+1, 1), mutualPosOffScores(y+1, 2)] = scorePairs(roster, mutualPosPairs, y);    
end

randNegOffScores
mutualNegOffScores
randPosOffScores
mutualPosOffScores
end

function [randomPairs, mutualPairs] = doTests(tasks, workers)
randomPairs = randomMatcher(tasks, workers);
mutualPairs = mutualMatcher(tasks, workers);
end