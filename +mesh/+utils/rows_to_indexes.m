function [vec] = rows_to_indexes(matrix)
    [values, vec] = max(matrix, [], 2);
    vec(~logical(values)) = 0;
end
