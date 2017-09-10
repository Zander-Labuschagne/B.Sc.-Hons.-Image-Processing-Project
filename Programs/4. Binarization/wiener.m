function image_wiener = wiener( image, kernel_size )
%Wiener low pass filter applied to binary image

    image_wiener = zeros(size(image, 1), size(image, 2));
    
    for i = 1 : size(image, 1)
        for ii = 1 : size(image, 2)
            msum = 0;
            %Calculating mean of local window
            for iii = i - fix(kernel_size / 2) : i + fix(kernel_size / 2)
                if(iii < 1)
                    v = iii + fix(kernel_size / 2);
                elseif(iii > size(image, 1))
                    v = iii - fix(kernel_size / 2);
                else
                    v = iii;
                end;
                for iv = ii - fix(kernel_size / 2) : ii + fix(kernel_size / 2)
                    if(iv < 1)
                        vi = iv + fix(kernel_size / 2);
                    elseif(iv > size(image, 2))
                        vi = iv - fix(kernel_size / 2);
                    else
                        vi = iv;
                    end;
                    msum = msum + double(image(v, vi));
                end;
            end;
            m = msum / (kernel_size .^ 2); 
            
            %calculating variance of local window
            vsum = 0;
            for vii = i - fix(kernel_size / 2) : i + fix(kernel_size / 2)
                if(vii < 1)
                    ix = vii + fix(kernel_size / 2);
                elseif(vii > size(image, 1))
                    ix = vii - fix(kernel_size / 2);
                else
                    ix = vii;
                end;
                for viii = ii - fix(kernel_size / 2) : ii + fix(kernel_size / 2)
                    if(viii < 1)
                        x = viii + fix(kernel_size / 2);
                    elseif(viii > size(image, 2))
                        x = viii - fix(kernel_size / 2);
                    else
                        x = viii;
                    end;
                    vsum = vsum + ((double(image(ix, x)) - m) ^ 2);
                end;
            end;
            v = vsum / (kernel_size ^ 2);

            %Calculating mean of estimated variance of all pixels in local window
            mevsum = 0;
            for xi = i - fix(kernel_size / 2) : i + fix(kernel_size / 2)
                if xi < 1
                    xiii = xi + fix(kernel_size / 2);
                elseif xi > size(image, 1)
                    xiii = xi - fix(kernel_size / 2);
                else
                    xiii = xi;
                end;
                for xii = ii - fix(kernel_size / 2)
                    if xii < 1
                        xiv = xii + fix(kernel_size / 2);
                    elseif xii > size(image, 2)
                        xiv = xii - fix(kernel_size / 2);
                    else
                        xiv = xii;
                    end;
                    
                    %calculate mean for estimated variance for each pixel in local
                    %window
                    evmsum = 0;
                    for xv = xiii - fix(kernel_size / 2) : xiii + fix(kernel_size / 2)
                        if xv < 1
                            xvii = xv + fix(kernel_size / 2);
                        elseif xv > size(image, 1)
                            xvii = xv - fix(kernel_size / 2);
                        else
                            xvii = xv;
                        end;
                        if xvii < 1
                            xxvi = xvii + fix(kernel_size / 2);
                        elseif xv > size(image, 1)
                            xxvi = xvii - fix(kernel_size / 2);
                        else
                            xxvi = xvii;
                        end;
                        for xvi = xiv - fix(kernel_size / 2) : xiv + fix(kernel_size)
                            if xvi < 1
                                xviii = xvi + fix(kernel_size / 2);
                            elseif xvi > size(image, 2)
                                xviii = xvi - fix(kernel_size / 2);
                            else
                                xviii = xvi;
                            end;
                            if xviii < 1
                                xxv = xviii + fix(kernel_size / 2);
                            elseif xviii > size(image, 2)
                                xxv = xviii - fix(kernel_size / 2);
                            else
                                xxv = xviii;
                            end;
                            evmsum = evmsum + double(image(xxvi, xxv));
                        end;
                    end;
                    evm = evmsum / (kernel_size ^ 2);
                    
                    %calculate estimated variance for each pixel in local
                    %window, also called sample variance
                    evsum = 0;
                    for xix = xi - fix(kernel_size / 2) : xi + fix(kernel_size / 2)
                        if xix < 1
                            xxi = xix + fix(kernel_size / 2);
                        elseif xix > size(image, 1)
                            xxi = xix - fix(kernel_size / 2);
                        else
                            xxi = xix;
                        end;
                        if xxi < 1
                            xxiv = xxi + fix(kernel_size / 2);
                        elseif xxi > size(image, 1)
                            xxiv = xxi - fix(kernel_size / 2);
                        else
                            xxiv = xxi;
                        end;
                        for xx = xii - fix(kernel_size / 2) : xii + fix(kernel_size)
                            if xx < 1
                                xxii = xx + fix(kernel_size / 2);
                            elseif xx > size(image, 2)
                                xxii = xx - fix(kernel_size / 2);
                            else
                                xxii = xx;
                            end;
                            if xxii < 1
                                xxiii = xxii + fix(kernel_size / 2);
                            elseif xxii > size(image, 2)
                                xxiii = xxii - fix(kernel_size / 2);
                            else
                                xxiii = xxii;
                            end;
                            evsum = evsum + ((double(image(xxiv, xxiii)) - evm) ^ 2);
                        end;
                    end;
                    ev = evmsum / ((kernel_size ^ 2) - 1);
                    mevsum = mevsum + ev;
                end;
            end;
            mev = mevsum / (kernel_size ^ 2);
            image_wiener(i, ii) = m + (((v - mev) * (image(i, ii) - m)) / (v));
        end;
    end;

end

