function [] = set_transparent_mesh(out)
    set(out, 'EdgeColor', 'default');
    set(out, 'FaceAlpha', 0.1);
    set(out, 'EdgeAlpha', 0.025);
    set(out, 'LineWidth', 0.1);
    axis equal;
end
