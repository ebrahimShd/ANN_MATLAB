function [ weight ] = PerceptronTrain( inputNo, NoTrain, haveBias, rate, trainX, trainY)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

weight = zeros(inputNo + (haveBias == true),1);
counter = 1;

while(1)
    wi = weight;
    for i = drange(1:NoTrain)
        result = ActFunction(trainX(i,:)*weight);
        if result ~= trainY(i)
            weight = weight + trainX(i,:)' * trainY(i)*rate;
        end
    end
    if (weight == wi) 
        if(counter > 1)
            break 
        end
    end
    counter = counter + 1;
end

return

end

