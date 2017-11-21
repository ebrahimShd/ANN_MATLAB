function [ weights ] = MexicanHatWeights( n, posRadius, negRadius, posWeight, negWeight )
%MEXICANHATWEIGHTS Summary of this function goes here
%   Detailed explanation goes here
weights = zeros(n);
for i=1:n
    for j=1:n
        if i==j
            weights(i,j) = 1;
        elseif abs(i-j) <= posRadius
            weights(i,j) = posWeight;
        elseif abs(i-j) <= negRadius
            weights(i,j) = negWeight;
        else
        end
    end
end

return

end

