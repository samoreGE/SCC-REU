function test = test()
clc
%TEST Summary of this function goes here
%   Detailed explanation goes here

% Determine where your m-file's folder is.
folder = fileparts(which('test.m')); 
% Add that folder plus all subfolders to the path.
addpath(genpath(folder));

rng(1)

generator = Generator;

roster = Roster(generator, 5);

[negOffTasks, negOffWorkers] = makeCast(roster,5, 0);

[firstservePairs, firstserveRanks] = firstserveMatcher(negOffTasks, negOffWorkers)