function [ weight ] = DeltaRule( trainX, trainY, trainRate )
%DELTARULE Summary of this function goes here
%   Detailed explanation goes here

[trainSets, inputUnits] = size(trainX);
[trainSets, outputUnits]= size(trainY);

weight = zeros([inputUnits+1, outputUnits]);
trainX = [trainX ones(trainSets,1)];

for n = 1:1000
    for i = 1:trainSets
        newW = weight + trainRate*trainX(i,:)'*(trainY(i,:)-trainX(i,:)*weight);
    end
    if abs(sum(newW-weight))<0.0001
        weight = newW;
        break
    else
        weight = newW;
    end
end

return

end

