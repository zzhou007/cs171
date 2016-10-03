%Zihang Zhou
%861090400
%April 18, 2016
%CS 171
%PS 2
function [ err ] = lambdaerror(v, X, Y, nfold, lambdas, I)
%vth segment is validation set outputs total error of labdas in col array
testing = [];
target = [];
err = [];

for i = 1:nfold %make testing and target that doesnt incude valid
    if i ~= v
        testing = cat(1, testing, X{i});
        target = cat(1, target, Y{i});
    end
end

[~, n] = size(lambdas);
for i = 1:n %loops through all lambda values
    weights = (inv((testing' * testing) + (lambdas(i) * I)) * (testing' * target))'; %weight formula;
    lerr = bsxfun(@times, X{v}, weights);
    lerr = sum(lerr, 2);%sum of all weights * x
    lerr = (Y{v} - lerr) .^ 2;%distance squared (error)
    [numValid, ~] = size(X{v});
    lerr = sum(lerr) ./ numValid; %average of (error)
    err = [err; lerr]; %form an array of all errors
end

end
