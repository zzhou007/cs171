%zihang zhou
%861090400
%April 30, 2016
%CS 171
%PS 3
function [ w ] = learnperceptron( X, Y, n, eta, w0, animate )
if animate
    hold on;
    pause('on');
    temp = X(: , 2:end);
    tempX1 = temp(:,1);
    tempX2 = temp(:,2);
    for i = 1:size(Y)
        if (Y(i) > 0)
            scatter(tempX1(i), tempX2(i), 'bx');
        else
            scatter(tempX1(i), tempX2(i), 'ro');
        end
    end
end
for max = 1:n
    done = 1;
    for i = 1:size(X, 1)
        h = X(i,:) * w0;
        if h * Y(i) < 0
            done = 0;
            w0 = w0 + ((eta * Y(i)) .* X(i,:))';
            if animate
                h = drawline(w0(2:3),w0(1));
                pause(0.1);
                delete(h);
            end
        end
    end
    if done
        h = drawline(w0(2:3),w0(1));
        break
    end
end    
    w = w0;
end

