function [ output ] = Hopefield( input, weights,  threshold )
%HOPEFIELD Summary of this function goes here
%   Detailed explanation goes here
output = input;
prevOutput = output;
while 1
    index = randi(length(input));
    output(index) = ThresholdActFunc(input(index) + output*weights(:,index),threshold);
    if max(abs(output-prevOutput))<0.0001
        break
    else
        prevOutput = output;
    end
end

end

