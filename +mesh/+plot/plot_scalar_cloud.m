function out = plot_scalar_cloud(vert, f, varargin)
    vert = pad_vert(vert);

    cmap = colormap;
    norm_f = fit_to_colormap(f, cmap);

    if nargin == 2
        out = scatter3(vert(:, 1), vert(:, 2), vert(:, 3), 30, cmap(norm_f,:), 'o', 'fill');
    else
        out = scatter3(vert(:, 1), vert(:, 2), vert(:, 3), varargin{1}, cmap(norm_f, :), varargin{2:end});
    end

    default;
end
