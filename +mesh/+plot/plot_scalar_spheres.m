function [out] = plot_scalar_spheres(vertices, scale_factor, f, varargin)
    [x, y, z] = sphere(20);
    n = size(vertices, 1);

    cmap = colormap;
    norm_f = fit_to_colormap(f, cmap);

    for ind = 1:n
        out = surf(scale_factor * x + vertices(ind,1), scale_factor * y + vertices(ind,2), scale_factor * z + vertices(ind,3), ...
                   'FaceColor', cmap(norm_f(ind), :), ...
                   'EdgeColor', 'none', varargin{:});
        material(out, [0.1 0.3 0.45])
    end

    default
end
