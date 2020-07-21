function massTester = massTester()

% Determine where your m-file's folder is.
folder = fileparts(which('massTester.m')); 
% Add that folder plus all subfolders to the path.
addpath(genpath(folder));

rng(1);

maxMembers = 5
testsPerRound = 20


for x = 1:maxMembers
    posOffsetMeans = [];
    negOffsetMeans = [];
    for y = 1:x-1
        posOffestMean = testMeans(doTests(x, testsPerRound, y));
        negOffsetMean = testMeans(doTests(x, testsPerRound, -y));
        posOffsetMeans(x-y, 1) = posOffestMean(1);
        posOffsetMeans(x-y, 2) = posOffestMean(2);
        negOffsetMeans(x-y, 1) = negOffsetMean(1);
        negOffsetMeans(x-y, 2) = negOffsetMean(2);
    end
    evenMeans = testMeans(doTests(x, testsPerRound, 0));
    posOffsetMeans(x, 1) = evenMeans(1);
    posOffsetMeans(x, 2) = evenMeans(2);
    negOffsetMeans(x, 1) = evenMeans(1);
    negOffsetMeans(x, 2) = evenMeans(2);
    x
    posOffsetMeans
    negOffsetMeans
end

end


function doTests = doTests(members, tests, offset)
%debug = "doTests, members=" + members + ", tests=" + tests + ", offset=" + offset
if offset>0
    for x = 1:tests
        newTest = taskMatcher(members, members-offset);
        doTests(x,1) =  newTest(1);
        doTests(x,2) =  newTest(2);
    end
elseif offset<0
    for x = 1:tests
        newTest = taskMatcher(members+offset, members);
        doTests(x,1) =  newTest(1);
        doTests(x,2) =  newTest(2);
    end
else
    for x = 1:tests
        newTest = taskMatcher(members, members);
        doTests(x,1) =  newTest(1);
        doTests(x,2) =  newTest(2);
    end
end
end

function testMeans = testMeans(test)
sum1 = 0;
sum2 = 0;
for x = 1:length(test)
    sum1 = sum1+test(x, 1);
    sum2 = sum2+test(x, 2);
end
testMeans = [sum1/length(test), sum2/length(test)];
end