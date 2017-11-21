function [ weight ] = HopefieldTrain( trainPatterns )
%HOPEFIELDTRAIN Summary of this function goes here
%   Detailed explanation goes here
weight = HebbTrain(trainPatterns, trainPatterns);
weight = Diag2Zero(weight);
return

end

