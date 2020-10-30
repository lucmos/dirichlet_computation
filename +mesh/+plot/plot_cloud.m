function out = plot_cloud(vert, varargin)
    vert = mesh.utils.pad_vert(vert);

    if nargin == 1
        out = scatter3(vert(:, 1), vert(:, 2), vert(:, 3), 30, 'r', 'o');
    else
        out = scatter3(vert(:, 1), vert(:, 2), vert(:, 3), varargin{:});
    end

    mesh.plot.default
end
