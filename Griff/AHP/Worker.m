classdef Worker
    %WORKER Describes a worker that can do tasks
    %   Detailed explanation goes here
    
    properties
        Reviews             %How previous employers felt about the worker. [0-1]
        Price               %The rates the worker typically charges. 0-1
        Availability        %How soon a worker can complete a task. 0-1
        RewardPref          %How much the worker cares about task monetary reward. 0-1
        SpecializationPref  %How much the worker cares about task specialization requirements. 0-1
        TimePref            %How much the worker cares about task time requirements. 0-1
    end
    
    methods
        function obj = Worker(reviews, price, availability, prefs)
            %WORKER Construct an instance of this class
            obj.Reviews = reviews;
            obj.Price = price;
            obj.Availability = availability;
            obj.RewardPref = prefs(1);
            obj.SpecializationPref = prefs(2);
            obj.TimePref = prefs(3);
        end
        
        function score = score(obj,task)
            %SCORETASK Scores a task based on a worker's preferences
            rewardScore = obj.RewardPref * task.Reward;
            specializationScore = obj.SpecializationPref * task.Specialization;
            timeScore = obj.TimePref * task.Time;
            score = rewardScore + specializationScore + timeScore;
        end
    end
end