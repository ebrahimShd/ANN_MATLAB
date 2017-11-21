function [vector] = Mat2Vec( matrix )
%MAT2VEC Summary of this function goes here
%   Detailed explanation goes here
    [row, column]=size(matrix);
    vector = zeros([1,row*column]);
    vector(1:column) = matrix(1,:);
    for i = 2:row
        vector((i-1)*column+1:i*column) = matrix(i,:);
    end
    return
end

