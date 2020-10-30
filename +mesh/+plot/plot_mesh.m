function [out] = plot_mesh(shape, varargin)
    out = trisurf(shape.TRIV, shape.VERT(:, 1), shape.VERT(:, 2), shape.VERT(:, 3), ...
                  varargin{:});
    material(out, [0.35, 0.5, 0.15])

    mesh.plot.default
end
