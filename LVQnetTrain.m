function [ weight,output ] = LVQnetTrain( trainX, trainY, trainRate, iteration, inWeight)
%LVQNET Summary of this function goes here
%   Detailed explanation goes here


nInput = size(trainX,2);
nOutput = size(trainY,2);
nTrain = size(trainX,1);

if length(inWeight)<1
    %weight = trainX(1:nOutput,:)';
%     weight = [-0.5 -0.5 0.5 0.5; -0.5 0.5 0.5 -0.5];
    weight=rand(nInput, nOutput);
    weight= (max(max(trainX))-min(min(trainX))).*weight + min(min(trainX))*ones(nInput,nOutput);
else
    weight = inWeight;
end

D = zeros(1,nOutput);
output = evaluateNet(weight, trainX,'competition');

if length(inWeight)>1
    return
end

for count=1:iteration
    for train=1:nTrain
        for i=1:nOutput
            D(i) = sqrt(sum((trainX(train,:)'-weight(:,i)) .^ 2));
        end
        [mn,mnId]=min(D);
        if(output(train,:)==trainY(train,:))
            weight(:,mnId)=weight(:,mnId)+trainRate(count)*(trainX(train,:)'-weight(:,mnId));
        else
            weight(:,mnId)=weight(:,mnId)-trainRate(count)*(trainX(train,:)'-weight(:,mnId));
        end
        output = evaluateNet(weight, trainX,'competition');
    end
end
   

end

function [output]=evaluateNet(weight, input, method)

    nOutput = size(weight,2);
    nTrain = size(input,1);
    D = zeros(1,nOutput);
    output = zeros(nTrain,nOutput);
            
    switch method
        case 'distance'
            for train = 1:nTrain
                for i=1:nOutput
                    D(i) = sqrt(sum((input(train,:)'-weight(:,i)) .^ 2));
                end
                [mn,mnId]=min(D);
                output(train,:)=zeros(1,nOutput);
                output(train,mnId)=1;
            end
        case 'competition'
            output = input*weight;
            output = max(output,[],2)*ones(1,nOutput)==output;
    end    


end

