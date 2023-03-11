function z = feature_projection(~, x_pca, projection_matrix,cos_window)

% get dimensions
[height, width] = size(cos_window);
[~, num_pca_out] = size(projection_matrix);

% do the windowing of the output
z = reshape(x_pca * projection_matrix, [height, width, num_pca_out]);
end