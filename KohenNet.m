function [ output, weight ] = KohenNet( input, nOutput, topology, neighborVector, trainRateVector, iteration )
%KOHENNET Summary of this function goes here
%   Detailed explanation goes here

weight = min(min(input)) + (max(max(input))-min(min(input)))*rand(size(input,2),nOutput);

D = zeros(1,nOutput);
for count=1:iteration
    for inputRow = 1:size(input,1)
        for i=1:nOutput
            D(i) = sqrt(sum((weight(:,i)-input(inputRow,:)').^2));
        end
        [mn,mnId]=min(D);
        condidateIndices=GetKohenNeighbors(mnId,nOutput,topology,neighborVector(count));
        for i=1:length(condidateIndices)
            weight(:,condidateIndices(i))=weight(:,condidateIndices(i)) + trainRateVector(count)*(input(inputRow,:)'-weight(:,condidateIndices(i)));
        end
    end
    plot(input(:,1),input(:,2),'*');
    hold on;
    plot(weight(1,:),weight(2,:));
    hold off;
    sprintf('%dth iteration. \n Press any key to continue ...',count)
    pause(0.1)
end
%weight = weight
output = input*weight; 
for i=1:size(input,1)
    [mx,maxId]=max(output(i,:));
    output(i,:) = zeros(1,nOutput);
    output(i,maxId)=1;
end

end

