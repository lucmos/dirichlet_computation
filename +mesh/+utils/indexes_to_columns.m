function [matrix] = indexes_to_columns(vec, r, c)
    % error: Out of range subscript.
    % matrix = zeros(r, c);
    % matrix(sub2ind(size(matrix), (1:length(vec))', vec(:))) = 1;
    assert( length(vec) <= c )
    assert( max(vec) <= r )

    matrix = zeros(r, c);
    for l = 1:length(vec)
        matrix(vec(l), l) = 1;
    end
end

