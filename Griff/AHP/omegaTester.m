function omegaTester = omegaTester()
clc
%OMEGATESTER Summary of this function goes here
%   Detailed explanation goes here

% Determine where your m-file's folder is.
folder = fileparts(which('omegaTester.m')); 
% Add that folder plus all subfolders to the path.
addpath(genpath(folder));
testsPerRound = 20
maxMembers = 20

constTasks = zeros(maxMembers, 3);
constWorkers = zeros(maxMembers, 3);
offsetTasks = zeros((2 * maxMembers) -1, 3);
offsetWorkers = zeros((2 * maxMembers) -1, 3);
constTasks(1,1:3) = testsPerRound;
constWorkers(1,1:3) = testsPerRound;

for z = 1:testsPerRound
    z
    [taskScores,  workerScores] = aggTester(maxMembers, maxMembers-1);
    offsetTasks = offsetTasks + taskScores;
    offsetWorkers = offsetWorkers + workerScores;
    for x = 2:maxMembers
        [taskMid,  workerMid] = aggTester(x, 1);
        newTasks(x, 1) = taskMid(2,1);
        newWorkers(x, 1) = workerMid(2,1);
        newTasks(x, 2) = taskMid(2,2);
        newWorkers(x, 2) = workerMid(2,2);
        newTasks(x, 3) = taskMid(2,3);
        newWorkers(x, 3) = workerMid(2,3);
    end
    constTasks = constTasks+ newTasks;
    constWorkers = constWorkers + newWorkers;
end

constWorkers = constWorkers/testsPerRound
constTasks = constTasks/testsPerRound
offsetTasks = offsetTasks/testsPerRound
offsetWorkers = offsetWorkers/testsPerRound
plot(constTasks)
end

