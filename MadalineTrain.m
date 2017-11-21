function [ weight1, weight2 ] = MadalineTrain( input, hiddenNeurons, output, threshold, trainRate, w1, w2 )
%MADALINETRAIN Summary of this function goes here
%   Detailed explanation goes here

n = hiddenNeurons;
[o,o] = size(output);
weight1 = w1;
weight2 = w2;
input = [input 1];
j=1;

for i=1:1:o
    while j<=n
        hiddenInput = input * weight1;
        [hiddenSortedId, sortedId] = sort(abs(hiddenInput));
        hidden = [ActFunction(hiddenInput) 1];
        netResults = ActFunction(hidden*weight2);
        delta = netResults - output;
        if abs(delta(i))>1e-3
            if abs(hiddenInput(sortedId(j)))<threshold;
                hidden(sortedId(j)) = -1*hidden(sortedId(j));
                newResults = ActFunction(hidden*weight2);
                if sum((newResults - output).^2) < sum((netResults - output).^2)
                    deltaJ= hidden(sortedId(j))*2;
                    while abs(deltaJ)>0
                        weight1(:,sortedId(j)) = weight1(:,sortedId(j)) + deltaJ * trainRate .* input';
                        deltaJ = hidden(sortedId(j)) - ActFunction(input*weight1(:,sortedId(j)));
                    end
                    j=1;
                else
                    j=j+1;
                end
            else
                j=j+1;
            end 
        else
            j=n+1;
        end
    end
end

j=1;

for i=1:1:o
    while j<=o
        hiddenInput = input * weight1;
        hidden = [ActFunction(hiddenInput) 1];
        outInput = hidden*weight2;
        [outSorted, sortedId] = sort(abs(outInput));
        netResults = ActFunction(outInput);
        delta = netResults - output;
        if abs(delta(i))>1e-3
            if abs(outInput(sortedId(j)))<threshold;
                newResults = netResults;
                newResults(sortedId(j)) = -1*newResults(sortedId(j));
                if sum((newResults - output).^2) < sum((netResults - output).^2)
                    deltaJ= newResults(sortedId(j))*2;
                    while abs(deltaJ)>0
                        weight2(:,sortedId(j)) = weight2(:,sortedId(j)) + deltaJ * trainRate .* hidden';
                        deltaJ = newResults(sortedId(j)) - ActFunction(hidden*weight2(:,sortedId(j)));
                    end
                    j=1;
                else
                    j=j+1;
                end
            else
                j=j+1;
            end
        else
            j=o+1;
        end
    end
end


return

end

