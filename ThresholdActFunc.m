function [ output ] = ThresholdActFunc( input, threshold )
%THRESHOLDACTFUNC Summary of this function goes here
%   Detailed explanation goes here

output1 = input>threshold;
output2 = -1*(input<threshold);
output3 = input.*(input == threshold);
output = output1+output2+output3;

end

