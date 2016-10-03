%Zihang Zhou
%861090400
%April 18, 2016
%CS 171
%PS 2
function [err, C] = knntest(TrainX, TrainY, TestX, TestY, k, lnorm)
    C = zeros(3,3);
    correct = 0;
    total = 0;
    for i = 1:size(TestY)
        if lnorm == 1
            dist = manhattanDist(TrainX, TestX, i);
        else
            dist = eucSqDist(TrainX, TestX, i);
        end
        guess = knearest(dist, TrainY, k);
        if guess == TestY(i)
            correct = correct + 1;
        end
        C(guess + 1, TestY(i) + 1) = C(guess + 1, TestY(i) + 1) + 1;
        total = total + 1;
    end
    C = C ./ total;
    err = (total - correct)/total;
end