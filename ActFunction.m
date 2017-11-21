function [ output ] = ActFunction( input )
%ACTIVATIONFUNCTION Summary of this function goes here
%   Detailed explanation goes here
    threshold = 0.0;
    output1 = input>=threshold;
    output2 = -1*(input<threshold);
    output = output1+output2;
    return

end

