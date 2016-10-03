%zihang zhou
%861090400
%may 16, 2015
%cs 171
%ps 4
function s = sigma(a)
%sigma of a vector
s = 1 ./ (1 + exp(-1 .* a));
