function [ output ] = CharacterRecog( input )
%CHARACTERRECOG Summary of this function goes here
%   Detailed explanation goes here
[m,n] = size(input);
for i=1:m
    for j=1:n
        if input(i,j)==1
            output(i,j)='#';
        elseif input(i,j)==-1
            output(i,j)='.';
        else
            output(i,j)='O';
        end
    end
end


end

