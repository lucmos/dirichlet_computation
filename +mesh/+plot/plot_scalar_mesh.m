function [out] = plot_scalar_mesh(shape, f, varargin)
    out = trisurf(shape.TRIV, ...
    shape.VERT(:, 1), shape.VERT(:, 2), shape.VERT(:, 3), ...
    f, 'EdgeColor', 'none', 'FaceColor', 'interp', varargin{:});
    material(out, [0.35, 0.5, 0.15])

    mesh.plot.default

end
