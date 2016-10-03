%zihang zhou
%861090400
%April 30, 2016
%CS 171
%PS 3
function [ W ] = multiclasslogreg( X, Y )
%find how many
max = 0;
for i = 1:size(Y, 1)
    if Y(i) > max
        max = Y(i);
    end
end
max = max + 1;

%add col of 1
X = [ones(size(X, 1), 1) X];

%find w for each possible
w = [];
for i = 1:max 
    w = [w calllogreg(i, X, Y)];
end

W = w;
end

function [w] = calllogreg(n, X, Y)
temp = Y;
for i = 1:size(temp, 1)
    if temp(i) == (n - 1);
        temp(i) = 1;
    else
        temp(i) = -1;
    end
end
w = learnlogreg(X, temp, 0.01);
end
