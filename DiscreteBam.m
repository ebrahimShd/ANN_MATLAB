function [ output ] = DiscreteBam( input, weights, threshold, outputIn)
%DISCRETEBAM Summary of this function goes here
%   Detailed explanation goes here
if size(weights,1)~=size(input,2)
    weights = weights';
end
if size(weights,1)~=size(input,2)
    return
end

if isempty(outputIn)
    output = zeros(size(weights,2));
else
    output=outputIn;
end
oldInput = input;
while 1
    output = BamThresholdActFunc(input*weights,threshold, output);
    input = BamThresholdActFunc(output*weights',threshold, input);
    if(max(abs(input - oldInput))<0.0001)
        break
    else
        oldInput = input;
    end
end
return

end

