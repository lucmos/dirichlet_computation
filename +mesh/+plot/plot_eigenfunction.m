function b = plot_eigenfunction(M, eigenfunction, varargin)
    b = plot_scalar_mesh(M, eigenfunction);
    caxis([ -max(abs(eigenfunction)), max(abs(eigenfunction))])
    colormap(bluewhitered(256))
    default
end
 
