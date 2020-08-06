function main = main()
clc
% Determine where your m-file's folder is.
folder = fileparts(which('main.m')); 
% Add that folder plus all subfolders to the path.
addpath(genpath(folder));

testsPerRound = 5
maxMembers = 20

constTasks = zeros(maxMembers, 3);
constWorkers = zeros(maxMembers, 3);
offsetTasks = zeros((2 * maxMembers) -1, 3);
offsetWorkers = zeros((2 * maxMembers) -1, 3);
constTasks(1,1:3) = testsPerRound;
constWorkers(1,1:3) = testsPerRound;

for z = 1:testsPerRound
    round = z
    debug = "Step 1: Max Size"
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
    
    debug = "Step 2: Offsets"
    [taskScores,  workerScores] = aggTester(maxMembers, maxMembers-1);
    offsetTasks = offsetTasks + taskScores;
    offsetWorkers = offsetWorkers + workerScores;
end

debug = "Step 3: Normalize Values"
constWorkers = constWorkers/testsPerRound
constTasks = constTasks/testsPerRound
offsetTasks = offsetTasks/testsPerRound
offsetWorkers = offsetWorkers/testsPerRound

debug = "Step 4: Graphing Values"
figure(1);
x = [1:maxMembers]
p = plot(constTasks);
p(1).LineWidth = 2;
p(2).LineWidth = 2;
p(3).LineWidth = 2;
title('Satisfaction of Task');
xlabel('Members');
ylabel('Satisfaction');
legend({'Random Assignment', 'Task Side Chooses', 'Stable Match'}, 'Location', 'northeast');
figure(2);

p = plot(constWorkers);
p(1).LineWidth = 2;
p(2).LineWidth = 2;
p(3).LineWidth = 2;
title('Satisfaction of Workers');
xlabel('Members');
ylabel('Satisfaction');
legend({'Random Assignment', 'Task Side Chooses', 'Stable Match'}, 'Location', 'northeast');
figure(3);

p = plot(offsetTasks);
p(1).LineWidth = 2;
p(2).LineWidth = 2;
p(3).LineWidth = 2;
title('Satisfaction of Task');
xlabel('Members');
ylabel('Satisfaction');
legend({'Random Assignment', 'Task Side Chooses', 'Stable Match'}, 'Location', 'northeast');

figure(4);
p = plot(offsetWorkers);
p(1).LineWidth = 2;
p(2).LineWidth = 2;
p(3).LineWidth = 2;
title('Satisfaction of Workers');
xlabel('Members');
ylabel('Satisfaction');
legend({'Random Assignment', 'Task Side Chooses', 'Stable Match'}, 'Location', 'northeast');
end

