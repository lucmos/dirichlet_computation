function [rand_vertices] = rand_tri_vertices(min_values, max_range)
    rand_vertices =  rand(3,3) .* max_range + min_values;
end