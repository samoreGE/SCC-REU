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
            val1 = rand;
            val2 = (1-val1)*rand;
            val3 = 1-val1-val2;
            rankerDist = [val1, val2, val3];            
            outputArg = Worker(rand, rand, rand, rankerDist);
        end
        function outputArg = makeRealTask
            val1 = rand;
            val2 = (1-val1)*rand;
            val3 = 1-val1-val2;
            rankerDist = [val1, val2, val3];
            outputArg = Task(rand, rand, rand, rankerDist);
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

