function [taskMatcher] = taskMatcher(realTasks, realWorkers)
%TASKMATCHER Makes a set of tasks and workers, then matches them together
%   Detailed explanation goes here

%debug = "taskMatcher, realTasks=" + realTasks + ", realWorkers=" + realWorkers

for x = 1:realTasks
    newTask = Task(rand, rand, rand, rankerDist);
    tasks(x) = newTask;
end
for x = 1:realWorkers
    newWorker = Worker(rand, rand, rand, rankerDist);
    workers(x) = newWorker;
end

if realTasks > realWorkers;
    %debug = "Generating Extra Workers..."
    for x = 1:(realTasks-realWorkers)
        workers(realWorkers+x) = Worker(0,0,0, [1/3, 1/3, 1/3]);
    end
else realTasks < realWorkers;
    %debug = "Generating Extra Tasks..."
    for x = 1:(realWorkers-realTasks)
        tasks(realTasks+x) = Task(0,0,0, [1/3, 1/3, 1/3]);
    end
end

taskPrefs = makeRanks(tasks, workers, length(tasks), length(workers));
workerPrefs = makeRanks(workers, tasks, length(workers), length(tasks));

pairs = SMP(taskPrefs, workerPrefs);

taskSat = 0;
for x = 1:realTasks
    taskSat =  taskSat + score(tasks(x), workers(pairs(x,1)));
end
taskMatcher(1) = taskSat/realTasks;

workerSat = 0;
for x = 1:realWorkers
    workerSat =  workerSat + score(workers(x), tasks(pairs(x,2)));
end
taskMatcher(2) = workerSat/realWorkers;

end

function rankerDist = rankerDist
val1 = rand;
val2 = (1-val1)*rand;
val3 = 1-val1-val2;
rankerDist = [val1, val2, val3];
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