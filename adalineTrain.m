function [ weight ] = adalineTrain( inputNo, NoTrain, haveBias, rate, trainX, trainY)
%ADALINETRAIN Summary of this function goes here
%   Detailed explanation goes here

weight = rand(inputNo + haveBias,1);
counter = 1;

while(1)
    wi = weight;
    for i = drange(1:NoTrain)
        result = IdentityFunc(trainX(i,:)*weight);
        weight = weight + trainX(i,:)' * (trainY(i)-result)*rate;
    end
    if max(abs(weight - wi))<0.001
        break
    end
    if counter > 100000
        break
    else
        counter = counter + 1;
    end
    
end

return

end

