%Zihang Zhou
%861090400
%April 18, 2016
%CS 171
%PS 2
function [k, lnorm] = cvknn(TrainX, TrainY, ValidX, ValidY, maxK)
%esd
esdCorrect = 0;
esdTotal = 0;
esdXvalues = [];
esdYvalues = [];
%mhtnd
mhtndCorrect = 0;
mhtndTotal = 0;
mhtndXvalues = [];
mhtndYvalues = [];
    for i = 1:2:maxK %all values of k
        for j = 1:size(ValidY) %all the valid points
            %esd
            esd = eucSqDist(TrainX, ValidX, j);
            esdGuess = knearest(esd, TrainY, i);
            if esdGuess == ValidY(j)
                esdCorrect = esdCorrect + 1;
            end
            esdTotal = esdTotal + 1;
            %mhtnd
            mhtnd = manhattanDist(TrainX, ValidX, j);
            mhtndGuess = knearest(mhtnd, TrainY, i);
            if mhtndGuess == ValidY(j)
                mhtndCorrect = mhtndCorrect + 1;
            end
            mhtndTotal = mhtndTotal + 1;
        end
        %esd
        esdError = (esdTotal - esdCorrect)/esdTotal;
        esdXvalues = [esdXvalues i];
        esdYvalues = [esdYvalues esdError];
        esdTotal = 0;
        esdCorrect = 0;
        %mhtnd
        mhtndCorrect;
        mhtndError = (mhtndTotal - mhtndCorrect)/mhtndTotal;
        mhtndXvalues = [mhtndXvalues i];
        mhtndYvalues = [mhtndYvalues mhtndError];
        mhtndTotal = 0;
        mhtndCorrect = 0;
    end
    hold on
    plot(mhtndXvalues, mhtndYvalues, '-ob', ...
        'LineWidth', 2);
    plot(esdXvalues, esdYvalues, '-og', ...
        'LineWidth', 2);
    xlabel('k');
    ylabel('error rate');
    legend('Manhattan', 'Euclidean', 'Location', 'southeast');
    [minEsd,minEsdk] = min(esdYvalues);
    [minMhtnd,minMhtndk] = min(mhtndYvalues);
    if (minEsd < minMhtnd)
        k = esdXvalues(minEsdk);
        lnorm = 2;
    else
        k = mhtndXvalues(minMhtndk);
        lnorm = 1;
    end
end

