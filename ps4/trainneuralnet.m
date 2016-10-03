%zihang zhou
%861090400
%may 16, 2015
%cs 171
%ps 4
function [ W1, W2 ] = trainneuralnet( X, Y, nhid, lambda )
%load x grid
gridX = getgridpts(X);

%generate random weight matrix
w1cols = size(X, 2);
w1rows = nhid;
w1 = -1 + (1 - -1) .* rand(w1rows, w1cols);
%generate another random weight matrix
w2cols = nhid + 1;
w2rows = 1;
w2 = -1 + (1 - -1) .* rand(w2rows, w2cols);

j = 0;
while 1
    j = j + 1;
    %n for each iteration
    n = 1000/(25000 + j);
    %sum of change in weight
    sdw1 = zeros(w1rows, w1cols);
    sdw2 = zeros(w2rows, w2cols);
    %for all points
    for i = 1:size(X, 1)
        %%forward
        %calculates hidden a vector
        hidden = bsxfun(@times, w1, X(i, :));
        hidden = sum(hidden, 2);
        %convert to z 
        hidden = sigma(hidden);
        %find f and ending delta
        f = [1; hidden]' * w2';
        f = sigma(f);
        
        %%backward
        %find ending delta
        deltaf = f - Y(i);
        %calculate delta col
        deltahid = [1; (hidden .* (1 - hidden))] .* (w2' * deltaf);
        %remove the beginning value
        deltahid = deltahid(2:end);
        
        %%calculate change in weight        
        dw2 = deltaf * [1; hidden]';
        dw1 = deltahid * X(i, :);
        %sum all elements 
        sdw1 = sdw1 + dw1;
        sdw2 = sdw2 + dw2;
    end
    %add regulerization 
    sdw1 = sdw1 + (2 .* lambda .* w1);
    sdw2 = sdw2 + (2 .* lambda .* w2);
    %check if we need to break out 
    checksdw1 = abs(sdw1);
    checksdw2 = abs(sdw2);
    if max(checksdw1(:)) < 0.001
        if max(checksdw2(:)) < 0.001
            break;
        end
    end
    %update all the weights
    w1 = w1 + (-n .* sdw1);
    w2 = w2 + (-n .* sdw2);
    if mod(j, 1000) == 0
        gridY = [];
        for k = 1:size(gridX, 1)
            %%forward
            %calculates hidden a vector
            hidden = bsxfun(@times, w1, gridX(k, :));
            hidden = sum(hidden, 2);
            %convert to z 
            hidden = sigma(hidden);
            %find f and ending delta
            tmpY = [1; hidden]' * w2';
            gridY = [gridY; sigma(tmpY)];
        end
        plotdecision(X, Y, gridX, gridY);
        drawnow;
    end
end
%assign final output weights 
W1 = w1;
W2 = w2;
%final output
gridY = [];
for k = 1:size(gridX, 1)
    %%forward
    %calculates hidden a vector
    hidden = bsxfun(@times, W1, gridX(k, :));
    hidden = sum(hidden, 2);
    %convert to z 
    hidden = sigma(hidden);
    %find f and ending delta
    tmpY = [1; hidden]' * W2';
    gridY = [gridY; sigma(tmpY)];
end
plotdecision(X, Y, gridX, gridY);
drawnow;
