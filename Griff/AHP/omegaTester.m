function omegaTester = omegaTester()
clc
%OMEGATESTER Summary of this function goes here
%   Detailed explanation goes here

% Determine where your m-file's folder is.
folder = fileparts(which('omegaTester.m')); 
% Add that folder plus all subfolders to the path.
addpath(genpath(folder));

testsPerRound = 20
maxMembers = 30

constTasks = zeros(maxMembers, 2)
constWorkers = zeros(maxMembers, 2)
offsetTasks = zeros((2 * maxMembers) -1, 2)
offsetWorkers = zeros((2 * maxMembers) -1, 2)
constTasks(1,1) = testsPerRound
constTasks(1,2) = testsPerRound
constWorkers(1,1) = testsPerRound
constWorkers(1,2) = testsPerRound
time = []
for x = 2:maxMembers
    x
    for y = 1:testsPerRound
        [randScores, mutualScores] = aggTester(x, x-1);
        y;
        randScores;
        mutualScores;
        constTasks(x, 1) = constTasks(x, 1) + randScores(x,1);
        constWorkers(x, 1) = constWorkers(x, 1) + randScores(x,2);
        constTasks(x, 2) = constTasks(x, 2) + mutualScores(x,1);
        constWorkers(x, 2) = constWorkers(x, 2)+ mutualScores(x,2);
    end
    constTasks
    constWorkers
end
constWorkers = constWorkers/testsPerRound
constTasks = constTasks/testsPerRound
constWorkers
constWorkers/2
plot(constWorkers)
end

