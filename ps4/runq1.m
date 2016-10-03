%zihang zhou
%861090400
%may 16, 2015
%cs 171
%ps 4
function [ P ] = runq1

%get data
load spamtrainX.data;
load spamtrainY.data;
load spamtestX.data

%size of validation set
validsize = size(spamtrainX, 1) * 0.25;
validsize = size(spamtrainX, 1) - validsize;

%split into vaild and testing
validX = spamtrainX(validsize+1:end, :);
validY = spamtrainY(validsize+1:end, :);
trainX = spamtrainX(1:validsize, :);
trainY = spamtrainY(1:validsize, :);

%learning and selecting the best weights
wlist = [];
wrong = 0;
lowest = inf;
for c = logspace(-2, 3, 20)
    [w, b] = learnsvm(trainX, trainY, c);
    for i = 1:size(validY, 1)
        if (validY(i) * (validX(i, :) * w + b)) < 0
            wrong = wrong + 1;
        end
    end
    wlist = [wlist; wrong];
    wrong = 0;
    if lowest > min(wlist)
        best = w;
        lowest = min(wlist);
    end
end

%create guess vector
P = []
for i = 1:size(spamtestX, 1)
    if (spamtestX(i, :) * w + b) >= 0
        P = [P; 1];
    else
        P = [P; -1];
    end
end
end
