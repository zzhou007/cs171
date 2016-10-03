%zihang zhou
%861090400
%April 30, 2016
%CS 171
%PS 3
function runp1()
S = load('simpleprob.dat');
X = S(:,1:2);
feature = ones([size(X, 1) 1]);
X = [feature X];
Y = S(:,3);
%starting weight
w0 = [100; 100; 100];
%max number of sweeps across data set
n = 100;
%scalor to multiply
eta = 1;

learnperceptron(X, Y, n, eta, w0, 1);
end