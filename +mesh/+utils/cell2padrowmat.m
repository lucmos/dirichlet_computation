% COnvert a cell array to a matrix, where each array becomes a padded row of the matrix
function B = cell2padrowmat(A)
    %Pad each element of A with zeros so that it's size becomes dims
    maxLength=max(cellfun(@(x)numel(x),A));
    B = cell2mat(cellfun(@(x)cat(2,reshape(x, 1, length(x)),zeros(1,maxLength-length(x))),A,'UniformOutput',false))
end
