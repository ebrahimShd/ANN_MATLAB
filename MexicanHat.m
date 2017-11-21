function [ output ] = MexicanHat( input, weight, iteration, xmax )
%MEXICANHAT Summary of this function goes here
%   Detailed explanation goes here
for i = 1:iteration
    input = max(0,input*weight);
end
output = input;
return

end

