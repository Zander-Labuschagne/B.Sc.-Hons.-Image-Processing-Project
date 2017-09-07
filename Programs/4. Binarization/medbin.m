function bin_med = medbin( image )
%Binarize image globally using the average pixel intensities of the image 

    image_1d = reshape(image', 1, (size(image, 1) * size(image, 2)));
    image_1d = sort(image_1d);
    med = image_1d(ceil(size(image_1d) / 2));
    %med
    
    bin_med = zeros(size(image, 1), size(image, 2));
    
    for i = 1 : size(image, 1)
        for ii = 1 : size(image, 2)
            if image(i, ii) < med(2)
                bin_med(i, ii) = 0;
            else
                bin_med(i, ii) = 1;
            end;
        end;
    end;
end

