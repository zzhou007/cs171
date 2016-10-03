%zihang zhou
%861090400
%may 28, 2016
%CS 171
%PS 5
function [ score ] = giniscore( frac )
score = 0;
%frac a row or col do till the end
l = max(size(frac));
for i = 1:l
    score = score + (frac(i) .* (1 - frac(i)));
end
end

