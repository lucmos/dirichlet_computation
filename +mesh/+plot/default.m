%% set_deafult_figure: function description
function [outputs] = default()
    axis equal
    rotate3d on
    ax = gca;               % get the current axis
    ax.Clipping = 'off';    % turn clipping off
    % lux
end
