function [vec] = columns_to_indexes(matrix)
    [values, vec] = max(matrix, [], 1);
    vec(~logical(values)) = 0;
end
