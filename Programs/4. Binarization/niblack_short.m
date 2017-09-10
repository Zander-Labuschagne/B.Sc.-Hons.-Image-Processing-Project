function image_niblack = niblack_short( image, local_window_size )
%function to binarize image by using Niblack's binarization algorithm

    k = -0.2;% as suggested by Khurshid et al.

    s = std2(image);

    %Binarize using values calculated above
    for i = 1 : size(image, 1)
        if(i - fix(local_window_size / 2) < 1)
            iii = i + fix(local_window_size / 2);
        elseif(i + fix(local_window_size / 2) > size(image, 1))
            iii = i - fix(local_window_size / 2);
        else
            iii = i;
        end;
        for ii = 1 : size(image, 2)
            if(ii - fix(local_window_size / 2) < 1)
                iv = ii + fix(local_window_size / 2);
            elseif(ii + fix(local_window_size / 2) > size(image, 2))
                iv = ii - fix(local_window_size / 2);
            else
                iv = ii;
            end;
            local_window = image(iii - fix(local_window_size / 2) : iii + fix(local_window_size / 2), iv - fix(local_window_size / 2) : iv + fix(local_window_size / 2));
            m = mean2(local_window);
            t = m + k * s;
            if(image(i, ii) < t)
                image_niblack(i, ii) = 0;
            else
                image_niblack(i, ii) = 255;
            end;
        end;
    end;
end

