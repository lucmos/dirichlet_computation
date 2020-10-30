function [indicator_matrix] = farthest_point_sampling(shape, number)
    sampled = [];
    sampled.n = number;
    sampled.VERT = zeros(number, 3);
    sampled.indexes = zeros(number, 1);
    
    first_v = randi([0, shape.n]);

    sampled.VERT(1,:) = shape.VERT(first_v, :);
    sampled.indexes(1) = first_v;

    d = pdist2(shape.VERT, sampled.VERT(1, :));

    for a=2:number
        % take row with maximum distance
        [~, sampled_distance_index] = max(d);

        sampled.indexes(a) = sampled_distance_index(1);
        sampled.VERT(a, :) = shape.VERT(sampled.indexes(a), :);

        % compute the minimum distance between each point in V and in S
        %
        % optimization: every time a vertex is added to S, the minimum
        % distance may only decrease (because we do not remove anything)
        % so it is enough to compute the distances only wrt the new vertex
        % added to S, and for each vertex take the minimium between this
        % distance and the previous one.
        d = min(pdist2(shape.VERT, sampled.VERT(a, :)), d);
    end

    indicator_matrix = sampled.indexes;
    % indicator_function = false(shape.n, 1);
    % indicator_function(sampled.indexes) = true;
    % indicator_matrix = indexes_to_matrix(sampled.indexes, sampled.n, shape.n);

    % indicator_matrix = zeros(shape.n, sampled.n);
    % for l = 1:length(sampled.indexes)
    %     indicator_matrix(sampled.indexes(l), l) = 1;
    % end
end
