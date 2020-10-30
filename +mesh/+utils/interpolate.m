function [interpolated] = interpolate(v1, v2, n)
    interpolated = zeros(n, 3);
    for i = 1:numel(v1)
        interpolated(:, i) = linspace(v1(i), v2(i), n);
    end
end