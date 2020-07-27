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
                castTasks = size
                castWorkers = size-offset
            elseif offset<0
                castTasks = size+offset
                castWorkers = size
            else
                castTasks = size
                castWorkers = size
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
        
        function [taskScores, workerScores] = scorePairs(obj, pairs, offset)
            if offset>0
                castTasks = length(obj.tasks)
                castWorkers = length(obj.workers)-offset
            elseif offset<0
                castTasks = length(obj.tasks)+offset
                castWorkers = length(obj.workers)
            else
                castTasks = length(obj.tasks)
                castWorkers = length(obj.workers)
            end
            workerSat = 0;
            taskSat = 0;
            for x = 1:castWorkers
                workerSat =  workerSat + score(obj.workers(x), obj.tasks(pairs(x,2)));
            end
            workerScores = workerSat/castWorkers;
            for x = 1:castTasks
                taskSat =  taskSat + score(obj.tasks(x), obj.workers(pairs(x,1)));
            end
            taskScores = taskSat/castTasks;
        end
    end
end

