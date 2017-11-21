function [ output ] = Diag2Zero( input )
%DIAG2ZERO Summary of this function goes here
%   Detailed explanation goes here
output = -1*(diag(ones(length(input),1))-1) .* input;

end

