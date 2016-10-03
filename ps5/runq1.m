%zihang zhou
%861090400
%may 28, 2016
%CS 171
%PS 5
function [ Y, dt ] = runq1()
    %load data half into train spilit into x and y
    bank = load('banktrain.data');
    train = bank(1:(end / 2) - 1, :);
    trainX = train(:, 1:end-1);
    trainY = train(:, end);
    %load other half into prune split into x and y
    prune = bank((end / 2) : end, :);
    pruneX = prune(:, 1:end-1);
    pruneY = prune(:, end);
    %learn dt
    ftypes = [0 12 4 8 3 3 3 2 0 0 0 0 0 3 0 0 0 0 0];
    dt = learndt(trainX, trainY, ftypes, @giniscore);
    %prune dt
    dt = prunedt(dt, pruneX, pruneY);
    drawdt(dt);
    %test dt
    banktestX = load('banktestX.data');
    Y = predictdt(dt, banktestX);
end