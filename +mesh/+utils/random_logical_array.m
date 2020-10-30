function [output] = random_logical_array(len, number_ones)
    array = [ones(number_ones, 1); zeros(len-number_ones, 1)];
    output = logical(array(randperm(len), :));
end
