%Zihang Zhou
%861090400
%April 18, 2016
%CS 171
%PS 2
function [ w, lambda, besterr ] = cvridge( X, Y, nfold, lambdas )
err = [];
[s, ~] = size(X);
s = [s 1];
X = cat(2, ones(s), X); %add col of 1 to beginning

holdX = X; %keep x and y before making into cell array
holdY = Y;

[~,Isize] = size(holdX); %identity matrix size features by features 
I = eye(Isize);
I(1,1) = 0;

[s, ~] = size(X);
segSize = ceil(s / nfold); %figures out how many points in each segment
segRem = mod(s,nfold);
if segRem > 0               %if does not evenly divide last segment is shorter
    seg = repmat(segSize, 1, nfold - 1);
    seg = [seg segRem];
    X = mat2cell(X, seg);
    Y = mat2cell(Y, seg);
else
    seg = repmat(segSize, 1, nfold);
    X = mat2cell(X, seg);
    Y = mat2cell(Y, seg);
end

for i = 1:nfold          %run through all validation sets 
    err = cat(2, err, lambdaerror(i, X, Y, nfold, lambdas, I)); %create a matrix num sets by lambdas 
end
err = sum(err, 2);
err = err ./ nfold;
semilogx(lambdas, err, '-bo');
[besterr, index] = min(err);
lambda = lambdas(index);
I(1, 1) = 0;
w = inv((holdX' * holdX) + (lambda * I)) * (holdX' * holdY); %weight formula
end

