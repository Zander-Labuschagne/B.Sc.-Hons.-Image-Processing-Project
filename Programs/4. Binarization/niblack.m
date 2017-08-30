function image_niblack = niblack( image, local_window_size )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    k = -0.2;%
    ssum = 0;

    %Calculate average of pixel intensities of whole image
    msum = 0;
    for vii = 1 : size(image, 1)
        for viii = 1 : size(image, 2)
            msum = msum + double(image(vii, viii));
        end;
    end;
    m = msum / (size(image, 1) * size(image, 2));
    
    %Calculate Standard Deviation of whole image
    for ix = 1 : size(image, 1)
        for x = 1 : size(image, 2)
            ssum = ssum + double(image(ix, x) - m) .^ 2;
        end;
     end;
     s = sqrt(double(1 / (size(image, 1) * size(image, 2)) * ssum));

    for i = 1 : size(image, 1)
        %disp(i);
        for ii = 1 : size(image, 2)
            %disp(ii);
            msum = 0;
            %disp(image(i, ii));
            for iii = i - fix(local_window_size / 2) : i + fix(local_window_size / 2)
                %disp(iii);
                if(iii < 1)
                    v = iii + fix(local_window_size / 2);
                elseif(iii > size(image, 1))
                    v = iii - fix(local_window_size / 2);
                else
                    v = iii;
                end;
                %disp(v);
                for iv = ii - fix(local_window_size / 2) : ii + fix(local_window_size / 2)
                    %disp(iv);
                    if(iv < 1)
                        vi = iv + fix(local_window_size / 2);
                    elseif(iv > size(image, 2))
                        vi = iv - fix(local_window_size / 2);
                    else
                        vi = iv;
                    end;
                    %disp(vi);
                    msum = msum + double(image(v, vi));
                end;
            end;
            %disp(msum);
            m = msum / (local_window_size .^ 2); 
            t = m + k * s;
            if(image(i, ii) < t)
                image_niblack(i, ii) = 0;
            else
                image_niblack(i, ii) = 255;
            end;
            %fprintf('Original: %f Niblack: %f\n', image(i, ii), image_niblack(i, ii));
        end;
    end;
end

