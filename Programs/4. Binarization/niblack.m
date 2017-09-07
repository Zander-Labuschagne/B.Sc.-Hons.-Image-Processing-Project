function image_niblack = niblack( image, local_window_size )
%function to binarize image by using Niblack's binarization algorithm

    k = -0.2;% as suggested by Khurshid et al.
    k = -0.5;% as suggested by Zander.

%     ssum = 0;
% 
%     %Calculate average of pixel intensities of whole image
%     msum = 0;
%     for vii = 1 : size(image, 1)
%         for viii = 1 : size(image, 2)
%             msum = msum + double(image(vii, viii));
%         end;
%     end;
%     m = msum / (size(image, 1) * size(image, 2));
%     
%     %Calculate Standard Deviation of whole image
%     for ix = 1 : size(image, 1)
%         for x = 1 : size(image, 2)
%             ssum = ssum + double(image(ix, x) - m) .^ 2;
%         end;
%      end;
%      s = sqrt(double(1 / (size(image, 1) * size(image, 2)) * ssum));
     s = std2(image);

    %Binarize using values calculated above
    for i = 1 : size(image, 1)
        for ii = 1 : size(image, 2)
            msum = 0;
            for iii = i - fix(local_window_size / 2) : i + fix(local_window_size / 2)
                if(iii < 1)
                    v =   + fix(local_window_size / 2);
                elseif(iii > size(image, 1))
                    v = iii - fix(local_window_size / 2);
                else
                    v = iii;
                end;
                for iv = ii - fix(local_window_size / 2) : ii + fix(local_window_size / 2)
                    if(iv < 1)
                        vi = iv + fix(local_window_size / 2);
                    elseif(iv > size(image, 2))
                        vi = iv - fix(local_window_size / 2);
                    else
                        vi = iv;
                    end;
                    msum = msum + double(image(v, vi));
                end;
            end;
            m = msum / (local_window_size .^ 2); 
            t = m + k * s;
            if(image(i, ii) < t)
                image_niblack(i, ii) = 0;
            else
                image_niblack(i, ii) = 255;
            end;
        end;
    end;
end

