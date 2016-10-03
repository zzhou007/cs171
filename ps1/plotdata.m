%zihang zhou
%861090400
%april 2, 2016
%cs 171
%PS 1
function [] = plotdata( fname, a1, a2 )
%   plot data
%   fname: the filename of this data (in this case, that would always be ’iris.dat’),
%   a1: a feature for the horizontal axis, and
%   a2: a feature for the vertical axis.Detailed explanation goes here
file = fopen(fname); %read file 
data = textscan(file, '%f%f%f%f%f'); %scan into a cell array
for i = 1:size(data{5}) 
    hold on
    %0 = red circle; 1 is blue x; 2 is green square
    if data{5}(i) == 0
        scatter(data{a1}(i), data{a2}(i), 'red')
    elseif data{5}(i) == 1
        scatter(data{a1}(i), data{a2}(i), 'blue', 'x')
    else
        scatter(data{a1}(i), data{a2}(i), 'green', 'square')
    end
    
end
xlabel(['attribute ' num2str(a1)])
ylabel(['attribute ' num2str(a2)])
end

