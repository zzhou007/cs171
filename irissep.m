%zihang zhou
%861090400
%april 2, 2016
%cs 171
%PS 1
function [] = irissep( fname )
%prints possible graphs 
%{
k = 0;
for i = 1:4
    for j = 1:4
        if i ~= j & i > j
            k = k + 1;
            subplot(2, 3, k)
            plotdata(fname, i, j)
        end
    end
end
%}
plotdata(fname, 3, 4)
title('w = [1 2], b = -8')
w = [1 2];
b = -8;
hold on
drawline(w, b)
end

