function padded = pad_vert(vert)
    vert = padarray(vert, [0, 3], 0, 'post');
    padded = vert(:, 1:3);
end
