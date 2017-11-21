function [ weight,output ] = LVQ2_1net( trainX, trainY, trainRate, iteration, inWeight )
%LVQ2_1NET Summary of this function goes here
%   Detailed explanation goes here

nInput = size(trainX,2);
nOutput = size(trainY,2);
nTrain = size(trainX,1);
tolerance = 0.35;

if length(inWeight)<1
    %weight = trainX(1:nOutput,:)';
%     weight = [-0.5 -0.5 0.5 0.5; -0.5 0.5 0.5 -0.5];
    weight=rand(nInput, nOutput);
    weight= (max(max(trainX))-min(min(trainX))).*weight + min(min(trainX))*ones(nInput,nOutput);
else
    weight = inWeight;
end

D = zeros(1,nOutput);
output = evaluateNet(weight, trainX,'distance');

if length(inWeight)>1
    return
end

for count=1:iteration
    for train=1:nTrain
        for i=1:nOutput
            D(i) = sqrt(sum((trainX(train,:)'-weight(:,i)) .^ 2));
        end
        [mn,mnId]=sort(D);
        
        if(output(train,mnId(1))~=output(train,mnId(2)))
            if mn(1)/mn(2)>1-tolerance && mn(2)/mn(1)<1-tolerance
                if(trainY(train,mnId(1))==output(train,mnId(2)))
                    weight(:,mnId(1))=weight(:,mnId(1))-trainRate(count)*(trainX(train,:)'-weight(:,mnId(1)));
                    weight(:,mnId(2))=weight(:,mnId(2))+trainRate(count)*(trainX(train,:)'-weight(:,mnId(2)));
                elseif(trainY(train,mnId(1))==output(train,mnId(1)))
                    weight(:,mnId(1))=weight(:,mnId(1))+trainRate(count)*(trainX(train,:)'-weight(:,mnId(1)));
                    weight(:,mnId(2))=weight(:,mnId(2))-trainRate(count)*(trainX(train,:)'-weight(:,mnId(2)));
                end
            end
        end
        output = evaluateNet(weight, trainX,'distance');
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

