function test = test()
%TEST Summary of this function goes here
%   Detailed explanation goes here

% Determine where your m-file's folder is.
folder = fileparts(which('test.m')); 
% Add that folder plus all subfolders to the path.
addpath(genpath(folder));

evenDist = [1/3, 1/3, 1/3];

for x = 1:3
    testWorkers(x) = Worker(0,0,0, evenDist);
end

for x = 1:3
    testTasks(x) = Task(0,0,0, evenDist);
end
taskPrefs = makeRanks(testTasks, testWorkers, length(testTasks), length(testWorkers))
end

function makeRanks = makeRanks(rankers, subjects, rankersAmnt, subjectsAmnt)
for x = 1:rankersAmnt
    ranker = rankers(x);
    rankedSubjects = rankByPrefs(ranker, subjects, subjectsAmnt);
    for y = 1:subjectsAmnt
        makeRanks(x,y) = rankedSubjects(y);
    end
end
end