%Zihang Zhou
%861090400
%April 18, 2016
%CS 171
%PS 2
function [eucSqDist] = eucSDist(TrainX, ValidX, i)
%returns esd from TrainX given point i in ValidX
    fun = @(A,B) (A-B).^2;
    eucSqDist = bsxfun(fun, TrainX, ValidX(i,:));
    eucSqDist = sum(eucSqDist, 2);
end