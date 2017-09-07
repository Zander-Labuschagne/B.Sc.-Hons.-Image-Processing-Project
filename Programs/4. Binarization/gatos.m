function bin_gatos = gatos(image, local_window_size)
%Binarize image by using Gatos algorithm
%   Detailed explanation goes here

    %Gatos pre-processing - basically Wiener low pass
    pre = zeros(size(image, 1), size(image, 2));
    
    for i = 1 : size(image, 1)
        for ii = 1 : size(image, 2)
            msum = 0;
            for iii = i - fix(local_window_size / 2) : i + fix(local_window_size / 2)
                if(iii < 1)
                    v = iii + fix(local_window_size / 2);
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
            
            for vii = i - fix(local_window_size / 2) : i + fix(local_window_size / 2)
                if(vii < 1)
                    ix = vii + fix(local_window_size / 2);
                elseif(vii > size(image, 1))
                    ix = vii - fix(local_window_size / 2);
                else
                    ix = vii;
                end;
                for viii = ii - fix(local_window_size / 2) : ii + fix(local_window_size / 2)
                    if(viii < 1)
                        x = viii + fix(local_window_size / 2);
                    elseif(viii > size(image, 2))
                        x = viii - fix(local_window_size / 2);
                    else
                        x = viii;
                    end;
                    vsum = vsum + (double(image(ix, x)) - m) ^ 2;
                end;
            end;
            v = vsum / ((local_window_size ^ 2) - 1);
            mv = ;
            pre(i, ii) = m + (((v - mv) * (image(i, ii) - m)) / (v));
            
            
            
            t = 
            
            
            if(image(i, ii) < t)
                bin_gatos(i, ii) = 0;
            else
                bin_gatos(i, ii) = 255;
            end;
        end;
    end;

end

