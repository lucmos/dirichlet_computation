function b = plot_eigenvalues(eigenvalues, varargin)
    line_width = 1;
    b = bar(eigenvalues, 'LineWidth', line_width, 'BarWidth', 1, 'FaceColor', 'flat');
    red = [0.9 0.1 0.1];
    green = [0.1 0.9 0.1];
    blue = [0.1 0.1 0.9];
    colormap(build_colormap(max([3, size(eigenvalues,2)]), 1, [red; green; blue]))    
    for k = 1:size(eigenvalues,2)
        b(k).CData = k;
    end
    
    l = legend(varargin{:}, 'Location', 'NorthWest');
    set(l, 'AutoUpdate', 'off');
     
    ylim([0 max([1, max(eigenvalues, [], 'all') * 1.5])])
    xlim([0 size(eigenvalues, 1) + line_width])
    zlim([0 1]);
%     axis off
end
