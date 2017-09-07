function bin_avg = avgbin( image )
%Binarize image globally using the average pixel intensities of the image 

    avg = mean2(image);
    bin_avg = zeros(size(image, 1), size(image, 2));
    
    for i = 1 : size(image, 1)
        for ii = 1 : size(image, 2)
            if image(i, ii) < avg
                bin_avg(i, ii) = 0;
            else
                bin_avg(i, ii) = 1;
            end;
        end;
    end;
end

