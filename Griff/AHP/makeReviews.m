function  makeReviews = makeReviews(numReviews)
%MAKEREVIEWS Summary of this function goes here
%   Detailed explanation goes here

% Determine where your m-file's folder is.
folder = fileparts(which('AHP.m')); 
% Add that folder plus all subfolders to the path.
addpath(genpath(folder));

%for x = 1:numReviews
        
%end

List1 = [1  3   2   4;
        3   4   1   2;
        4   2   3   1;
        3   2   1   4;];
        
List2 = [2  1   3   4;
        4   1   2   3;
        1   3   2   4;
        2   3   1   4;];
    
SMP(List2, List1)
end