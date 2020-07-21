classdef Task
    %TASK Describes a task a worker can do
    %   Detailed explanation goes here
    
    properties
        Reward              %Monetary incentive for completing a task. 0-1
        Specialization      %Skills/tools required for completing a task. 0-1
        Time                %Amount of time the task will take to complete. 0-1
        ReviewsPref         %How much the task cares about worker reviews. 0-1
        PricePref           %How much the task cares about worker price. 0-1
        AvailabilityPref    %How much a task cares about availability. 0-1
    end
    
    methods
        function obj = Task(reward,specialization,time,prefs)
            %TASK Construct an instance of this class
            obj.Reward = reward;
            obj.Specialization = specialization;
            obj.Time = time;
            obj.ReviewsPref = prefs(1);
            obj.PricePref = prefs(2);
            obj.AvailabilityPref = prefs(3);
        end
        
        function score = score(obj,worker)
            %SCOREWORKER scores a worker based on a task's preferences 
            reviewsScore = obj.ReviewsPref * worker.Reviews;
            priceScore = obj.PricePref * worker.Price;
            availabilityScore = obj.AvailabilityPref * worker.Availability;
            score = reviewsScore + priceScore + availabilityScore;
        end
    end
end