function image_sauvola = sauvola(image, local_window_size)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    k = 0.5;
    R = 128;
    S = std2(image);
    k = 0.065;
    
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
            t = m * (1 - k * (1 - S / R));
            
            if(image(i, ii) < t)
                image_sauvola(i, ii) = 0;
            else
                image_sauvola(i, ii) = 255;
            end;
        end;
    end;

end

