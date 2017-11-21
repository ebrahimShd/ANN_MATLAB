function [ matrix ] = Vec2Mat( vector, columns )
%VEC2MAT Summary of this function goes here
%   Detailed explanation goes here
vecSize=size(vector);
rows = round(max(vecSize)/columns,0);
matrix = zeros([rows, columns]);
for i=1:rows
    matrix(i,:)=vector((i-1)*columns+1:i*columns);
end
return

end

