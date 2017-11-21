function [ weight ] = HebbTrain( trainX, trainY )
%HEBBTRAIN Summary of this function goes here
%   Detailed explanation goes here

%[trainSets inputUnits] = size(trainX);
%trainX = [trainX ones(trainSets,1)];

weight = trainX'*trainY;

end