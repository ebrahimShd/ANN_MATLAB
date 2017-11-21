function [ w ] = HammingTrain( examplars )
%HAMMINGTRAIN Summary of this function goes here
%   Detailed explanation goes here
[nTrain,nVector] = size(examplars);

w = examplars ./2;
w = [w nVector/2*ones(nTrain,1)]';
return
end

