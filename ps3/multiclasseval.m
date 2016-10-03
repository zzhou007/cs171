%zihang zhou
%861090400
%April 30, 2016
%CS 171
%PS 3
function [ err ] = multiclasseval( w, X, Y )
%add col of 1s
X = [ones(size(X, 1), 1) X];

%multiply through the weights
classes = size(w, 2);
result = [];
for i = 1:classes
    temp = bsxfun(@times, X, w(:,i)');
    temp = sum(temp, 2);
    result = [result temp];
end

%calculate error 
correct = 0;
wrong = 0;
for i = 1:size(Y, 1)
    [~, guess] = max(result(i, :));
    guess = guess - 1;
    if guess == Y(i)
        correct = correct + 1;
    else
        wrong = wrong + 1;
    end
end
err = wrong;
end

