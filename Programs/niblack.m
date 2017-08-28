function image_niblack = niblack( image, local_window_size )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

k = -0.2;

%Truncate die deling
    for i = 1 : size(image, 1)
        for ii = 1 : size(image, 2)
            msum = 0;
            ssum = 0;
            for iii = i - local_window_size / 2 : i + local_window_size / 2
                if(iii < 1)
                    v = iii + local_window_size;
                else if(iii > size(image, 1))
                    v = iii - local_window_size;
                else
                    v = iii;
                end;
                for iv = ii - local_window_size / 2 : ii + local_window_size / 2
                    if(iv < 1)
                        vi = iv + local_window_size;
                    else if(iv > size(image, 2))
                        vi = iv - local_window_size;
                    else
                        vi = iv;
                    end;
                    msum = msum + image(v, vi);
                end;
            end;
            
            m = msum / (local_window_size .^ 2); 

            %Again after calculated average to calculate standard deviation
            for iii = i - local_window_size / 2 : i + local_window_size / 2
                if(iii < 1)
                    v = iii + local_window_size;
                else if(iii > size(image, 1))
                    v = iii - local_window_size;
                else
                    v = iii;
                end;
                for iv = ii - local_window_size / 2 : ii + local_window_size / 2
                    if(iv < 1)
                        vi = iv + local_window_size;
                    else if(iv > size(image, 2))
                        vi = iv - local_window_size;
                    else
                        vi = iv;
                    end;
                    ssum = msum + ((image(v, vi) - m) .^ 2);%Check of die .^ 2 op regte plek is
                end;
            end;
            s = sqrt(1 / (local_window_size .^ 2) * ssum);% .^ Moet dalk hier kom?
            image_niblack(i, ii) = m + k * s;
        end;
    end;
                   
end

