function [out] = plot_spheres(vertices, scale_factor, varargin)
    [x, y, z] = sphere(10);
    n = size(vertices, 1);
    for ind = 1:n
        out = surf(scale_factor * x + vertices(ind,1), scale_factor * y + vertices(ind,2), scale_factor * z + vertices(ind,3), ...
                   'FaceColor', 'r', 'EdgeColor', 'none', varargin{:});
        material(out, [0.1 0.3 0.45])
    end

    default
end
