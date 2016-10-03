%Zihang Zhou
%861090400
%April 18, 2016
%CS 171
%PS 2
function [mhtnd] = manhattanDist(TrainX, ValidX, i)
%returns mhtnd from TrainX given point i in ValidX
    fun = @(A, B) abs(A - B);
    mhtnd = bsxfun(fun, TrainX, ValidX(i,:));
    mhtnd = sum(mhtnd, 2);
end

