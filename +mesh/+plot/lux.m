%% set_deafult_figure: function description
function [outputs] = lux()
    % todo: imposta l'eliminazioni luci solo dal sublplot corrente
    % reset the lights
    % delete(findall(gcf, 'Type', 'light'));
    light
    lighting gouraud
    camlight head
end
