classdef Roster
    %ROSTER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        memberGenerator
        tasks
        workers
    end
    
    methods
        function obj = Roster(generator, size)
            %ROSTER Construct an instance of this class
            %   Detailed explanation goes here
            obj.memberGenerator = generator;
            obj.tasks = [obj.memberGenerator.makeRealTask];
            obj.workers = [obj.memberGenerator.makeRealWorker];
            for x = 2:size
                obj.tasks(x) = obj.memberGenerator.makeRealTask;
                obj.workers(x) = obj.memberGenerator.makeRealWorker;
            end
        end
        
        function [workersOut, tasksOut] = makeCast(obj, size, offset)
            if offset>0
                castTasks = size;
                castWorkers = size-offset;
            elseif offset<0
                castTasks = size+offset;
                castWorkers = size;
            else
                castTasks = size;
                castWorkers = size;
            end
            for x = 1:size
                if x<castTasks
                    tasksOut(x) = obj.tasks(x);
                else
                    tasksOut(x) = obj.memberGenerator.makeDummyTask;
                end
                if x<castWorkers
                    workersOut(x) = obj.workers(x);
                else
                    workersOut(x) = obj.memberGenerator.makeDummyWorker;
                end
            end
        end
        
        function [taskScores, workerScores] = scorePairs(obj, pairs, ranks, offset)
            if offset>0
                castTasks = length(obj.tasks);
                castWorkers = length(obj.workers)-offset;
            elseif offset<0
                castTasks = length(obj.tasks)+offset;
                castWorkers = length(obj.workers);
            else
                castTasks = length(obj.tasks);
                castWorkers = length(obj.workers);
            end
            castTasks
            castWorkers
            workerSat = 0;
            taskSat = 0;
            realMatches = 0;
            taskStep = .5/castWorkers
            workerStep = .5/castTasks
            debug = "SCORING TASKS"
            for x = 1:castTasks
                pick = pairs(x, 1)
                rank  = ranks(x, 1)
                if pairs(x, 1)>castWorkers
                    debug = "OPTION 1"
                    taskSat     = taskSat + .5
                else
                    debug = "OPTION 2"
                    taskSat     = taskSat + (((castWorkers - ranks(x, 1) + 1) * taskStep) + .5)
                end
            end
            taskScores = taskSat/castTasks;
            debug = "SCORING WORKERS"
            for x = 1:castWorkers
                if pairs(x, 2)>castTasks
                    debug = "OPTION 1"
                    workerSat   = workerSat + .5
                else
                    debug = "OPTION 2";
                    workerSat   = workerSat + (((castTasks - ranks(x, 2) + 1) * workerStep) + .5)
                    
                end
            end
            workerScores = workerSat/castWorkers;
            
        end
        
        function makeRanks = makeRanks(pickers, targets, pickersAmnt, targetsAmnt)
            for x = 1:pickersAmnt
                ranker = pickers(x);
                rankedSubjects = rankByPrefs(ranker, targets, targetsAmnt);
                for y = 1:targetsAmnt
                    makeRanks(x,y) = rankedSubjects(y);
                end
            end
        end
    end
end

