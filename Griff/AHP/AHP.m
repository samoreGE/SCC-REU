function AHP = AHP()

% Determine where your m-file's folder is.
folder = fileparts(which('AHP.m')); 
% Add that folder plus all subfolders to the path.
addpath(genpath(folder));


A = [1	2	3   1/2	1/4;
    1/2	1	3	1/4	1/3;
	1/3	1/3	1	1/7	1/7;
	2	4	7	1	1/3;
    4	3	7	4	1;];

B = [1  1/3 5;
    3   1   7;
    1/5 1/7 1;];

C = randomMatrix(5)

test = A;

nMatrix = normalizeMatrix(test);
handPVector = priorityVector(nMatrix)

end