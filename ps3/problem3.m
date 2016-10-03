%zihang zhou
%861090400
%April 30, 2016
%CS 171
%PS 3i
function problem3
%load data
S = load('phishing.dat');

%split x and y
X = [S(:,1:end-1)];
Y = [S(:,end)];

%prealocate mem for dim 2
sized2 = 0;
for i = 1:size(X,2)
    sized2 = sized2 + i;
end
d2 = zeros(size(X,1), sized2);

%calculate dim 2 
pos = 1;
for k = 1:size(X,1)
    for i = 1:size(X,2)
        for j = i:size(X, 2)
            d2(k, pos) = X(k,i)*X(k,j);
            pos = pos + 1;
        end
    end
    pos = 1;
end

%add col of 1 at beginning
X = [ones(size(X,1), 1) X];
d2 = [X d2];

%test for best matched line
highest = 0;
best = 0;

%test 1 dim
lambda = 0.1;
while lambda <= 100
    w = learnlogreg(X, Y, lambda);
    out = bsxfun(@times, X, w');
    out = sum(out, 2);
    out = out .* Y;
    correct = 0;
    for i = 1:size(out,1)
      if out(i) > 0
        correct = correct + 1;
      end
    end
    if (correct > highest)
        highest = correct / size(X, 1);
        best = 1;
    end
    lambda;
    correct;
    lambda = lambda * 10;
end

%test 2 dim
lambda = 0.1;
while lambda <= 100
    w = learnlogreg(d2, Y, lambda);
    out = bsxfun(@times, d2, w');
    out = sum(out, 2);
    out = out .* Y;
    correct = 0;
    for i = 1:size(out, 1)
        if out(i) > 0
            correct = correct + 1;
        end
    end
    if (correct > highest)
        highest = correct / size(X, 1);
        best = 2;
    end
    lambda;
    correct;
    lambda = lambda * 10;
end

%return best
highest;
if best == 1
    disp('linear');
else
    disp('quadratic');
end
end

