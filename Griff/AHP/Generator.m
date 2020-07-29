classdef Generator
    %GENERATOR Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods (Static)
        function obj = Generator()
        end
        
        function outputArg = makeRealWorker
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            prefMatrix = randomMatrix(3)
            nMatrix = normalizeMatrix(prefMatrix);
            handPVector = priorityVector(nMatrix)         
            outputArg = Worker(rand, rand, rand, handPVector);
        end
        function outputArg = makeRealTask
            prefMatrix = randomMatrix(3)
            nMatrix = normalizeMatrix(prefMatrix);
            handPVector = priorityVector(nMatrix)
            outputArg = Task(rand, rand, rand, handPVector);
        end
        function outputArg = makeDummyWorker
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = Worker(0,0,0, [1/3, 1/3, 1/3]);
        end
        function outputArg = makeDummyTask
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = Task(0,0,0, [1/3, 1/3, 1/3]);
        end
    end
end

