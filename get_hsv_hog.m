function [ feature_map ] = get_hsv_hog( im, fparam, gparam)

    if ~isfield(fparam, 'nOrients')
        fparam.nOrients = 9;
    end
    if isfield(fparam, 'cell_size')
        cell_size = fparam.cell_size;
    else
        cell_size = gparam.cell_size;
    end
    
     [im_height, im_width, num_im_chan, num_images] = size(im);

    feature_map = zeros(floor(im_height/cell_size), floor(im_width/cell_size), fparam.nDim, num_images, 'like', gparam.data_type);
    for i = 1:num_images
        for c = 1:num_im_chan
            hsv_map = rgb2hsv(im(:,:,:,i));
            tmp_im = hsv_map(:,:,c);
            tmp_hog_map = fhog(single(tmp_im), cell_size, fparam.nOrients);
            %the last dimension is all 0 so we can discard it
            tmp_hog_map = tmp_hog_map(:,:,1:end-1);
            if (c == 1)
                tmp_feature_map = tmp_hog_map;
            else
                tmp_feature_map = cat(3, tmp_feature_map, tmp_hog_map);
            end        
        end
        feature_map(:,:,:,i) = tmp_feature_map;
    end
end