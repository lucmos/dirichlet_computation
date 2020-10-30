function view_image(image)
    imshow(image)
    axis equal
    axis off
    xlim([1 size(image, 1)])
    ylim([1 size(image, 2)])
end
