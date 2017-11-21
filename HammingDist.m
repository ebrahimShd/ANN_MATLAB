function [ output ] = HammingDist( vec1, vec2, isAverage )
%HAMMINGDIST Summary of this function goes here
%   Detailed explanation goes here

output = 0;
if length(vec1)<=length(vec2)
    n = length(vec1);
    for i = 1:length(vec1)
        if vec1(i) ~= vec2(i)
            output = output+1;
        end
    end
else
    n = length(vec2);
    for i = 1:length(vec2)
        if vec1(i) ~= vec2(i)
            output = output+1;
        end
    end
end

if isAverage
    output = output/n;
end

return
    

end

