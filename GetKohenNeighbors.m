function [ neighborIncices ] = GetKohenNeighborIndices( index, nInput, topology, nNeighbor )
%GETKOHENNEIGHBORS Summary of this function goes here
%   Detailed explanation goes here
switch topology
    case 'None'
        neighborIncices = index;
    case 'Linear'
        neighborIncices = [max(1,index-nNeighbor):min(nInput,index+nNeighbor)];
    case 'LinearLoop'
        if(index-nNeighbor)>0
            start = index-nNeighbor;
        else
            start = nInput + index - nNeighbor;
        end
        if(index+nNeighbor)<=nInput
            End = index+nNeighbor;
        else
            End = index + nNeighbor - nInput;
        end 
        if(start<=End)
            neighborIncices = [start:End];
        else
            neighborIncices = [start:nInput 1:End];
        end
    case 'Rectangular'
        nRows = floor(sqrt(nInput));
        nCols = ceil(nInput/nRows);
        iIndex = ceil(index/nCols);
        jIndex = index - (iIndex - 1)*nCols;
        iIndices = [max(1,iIndex-nNeighbor):min(nRows,iIndex+nNeighbor)];
        jIndices = [max(1,jIndex-nNeighbor):min(nCols,jIndex+nNeighbor)];
        neighborIncices = zeros(1,length(iIndices)*length(jIndices));
        for i = 1: length(iIndices)
            for j = 1:length(jIndices)
                neighborIncices((i-1)*length(jIndices)+j) = (iIndices(i)-1)*nCols + jIndices(j);
            end 
        end
    case 'Hexagonal'
        
    otherwise
        
end
    
    


end

