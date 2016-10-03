%Zihang Zhou
%861090400
%April 18, 2016
%CS 171
%PS 2
function [ class ] = knearest(dist, TrainY, k)
%returns the classification given dist, kth nearest and the array of points
    classes = zeros(1, max(TrainY) + 1);
    temp = [dist TrainY];
    temp = sortrows(temp);
    for i = 1:k
        classes(temp(i,2) + 1) = classes(temp(i,2) + 1) + 1;
    end
    [~,class] = max(classes);
    class = class - 1;
end