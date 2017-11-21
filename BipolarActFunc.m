function [ output ] = BipolarActFunc( input)
%BIPOLARACTFUNC Summary of this function goes here
%   Detailed explanation goes here
output1 = input>0;
output2 = input<0;
zeros = output1 + output2;
output = (2*output1-1);
output = output .* zeros;
return

end

