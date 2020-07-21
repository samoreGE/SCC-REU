function jobMatcher = jobMatcher()
%JOBMATCHER Summary of this function goes here
%   Detailed explanation goes here

% Determine where your m-file's folder is.
folder = fileparts(which('jobMatcher.m')); 
% Add that folder plus all subfolders to the path.
addpath(genpath(folder));

members = 4

for x = 1:members
    newTaskPrefs = productRanker(4, 4, members);
    newWorkerPrefs = productRanker(4, 4, members);
    for y = 1:members
        taskPrefs(x, y) = newTaskPrefs(y);
        workerPrefs(x, y) = newWorkerPrefs(y);
    end
    
end
workerPrefs
taskPrefs
SMP(workerPrefs, taskPrefs)


end

