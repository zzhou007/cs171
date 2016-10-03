%Zihang Zhou
%861090400
%April 18, 2016
%CS 171
%PS 2
function [ err ] = regerr( w, X, Y )
[s, ~] = size(X);
s = [s 1];
X = cat(2, ones(s), X); %add col of 1 to beginning
w = w';
X = bsxfun(@times, X, w);
err = sum(X, 2);
err = (Y - err) .^ 2;
err = sum(err); %returns total squared error
end