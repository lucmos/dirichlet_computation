function [matrix] = indexes_to_rows(vec, r, c)
    % error: Out of range subscript.
    % matrix = zeros(r, c);
    % matrix(sub2ind(size(matrix), vec(:), (1:length(vec))')) = 1;
    assert( length(vec) <= r )
    assert( max(vec) <= c )

    matrix = zeros(r, c);
    for l = 1:length(vec)
        matrix(l, vec(l)) = 1;
    end
end
