function bin_gatos = gatos(image, local_window_size)
%Binarize image by using Gatos algorithm
%   Detailed explanation goes here

    %Gatos pre-processing - supose to be Wiener low pass
    cprintf('UnterminatedStrings', '      Gatos pre-processing started...\n');
%     pre = zeros(size(image, 1), size(image, 2));
%     
%     
%     for i = 1 : size(image, 1)
%         for ii = 1 : size(image, 2)
%             msum = 0;
%             %Calculating mean of local window
% %             cprintf('UnterminatedStrings', '      Calculate mean of local window...\n');
%             for iii = i - fix(local_window_size / 2) : i + fix(local_window_size / 2)
%                 if(iii < 1)
%                     v = iii + fix(local_window_size / 2);
%                 elseif(iii > size(image, 1))
%                     v = iii - fix(local_window_size / 2);
%                 else
%                     v = iii;
%                 end;
%                 for iv = ii - fix(local_window_size / 2) : ii + fix(local_window_size / 2)
%                     if(iv < 1)
%                         vi = iv + fix(local_window_size / 2);
%                     elseif(iv > size(image, 2))
%                         vi = iv - fix(local_window_size / 2);
%                     else
%                         vi = iv;
%                     end;
%                     msum = msum + double(image(v, vi));
%                 end;
%             end;
%             m = msum / (local_window_size .^ 2); 
% %             cprintf('Green', '      Calculated mean of local window.\n');
%             
%             %calculating variance of local window
% %             cprintf('UnterminatedStrings', '      Calculate variance of local window...\n');
%             vsum = 0;
%             for vii = i - fix(local_window_size / 2) : i + fix(local_window_size / 2)
%                 if(vii < 1)
%                     ix = vii + fix(local_window_size / 2);
%                 elseif(vii > size(image, 1))
%                     ix = vii - fix(local_window_size / 2);
%                 else
%                     ix = vii;
%                 end;
%                 for viii = ii - fix(local_window_size / 2) : ii + fix(local_window_size / 2)
%                     if(viii < 1)
%                         x = viii + fix(local_window_size / 2);
%                     elseif(viii > size(image, 2))
%                         x = viii - fix(local_window_size / 2);
%                     else
%                         x = viii;
%                     end;
%                     vsum = vsum + ((double(image(ix, x)) - m) ^ 2);
%                 end;
%             end;
%             v = vsum / (local_window_size ^ 2);
% %             cprintf('Green', '      Calculated variance of local window.\n');
% 
%             %Calculating mean of estimated variance of all pixels in local window
% %              cprintf('UnterminatedStrings', '      Calculate mean of estimated variance of local window...\n');
%             mevsum = 0;
%             for xi = i - fix(local_window_size / 2) : i + fix(local_window_size / 2)
%                 if xi < 1
%                     xiii = xi + fix(local_window_size / 2);
%                 elseif xi > size(image, 1)
%                     xiii = xi - fix(local_window_size / 2);
%                 else
%                     xiii = xi;
%                 end;
%                 for xii = ii - fix(local_window_size / 2)
%                     if xii < 1
%                         xiv = xii + fix(local_window_size / 2);
%                     elseif xii > size(image, 2)
%                         xiv = xii - fix(local_window_size / 2);
%                     else
%                         xiv = xii;
%                     end;
%                     
%                     %calculate mean for estimated variance for each pixel in local
%                     %window
% %                     cprintf('UnterminatedStrings', '        Calculate mean for estimated variance for each pixel in local window...\n');
%                     evmsum = 0;
%                     for xv = xiii - fix(local_window_size / 2) : xiii + fix(local_window_size / 2)
%                         if xv < 1
%                             xvii = xv + fix(local_window_size / 2);
%                         elseif xv > size(image, 1)
%                             xvii = xv - fix(local_window_size / 2);
%                         else
%                             xvii = xv;
%                         end;
%                         if xvii < 1
%                             xxvi = xvii + fix(local_window_size / 2);
%                         elseif xv > size(image, 1)
%                             xxvi = xvii - fix(local_window_size / 2);
%                         else
%                             xxvi = xvii;
%                         end;
%                         for xvi = xiv - fix(local_window_size / 2) : xiv + fix(local_window_size)
%                             if xvi < 1
%                                 xviii = xvi + fix(local_window_size / 2);
%                             elseif xvi > size(image, 2)
%                                 xviii = xvi - fix(local_window_size / 2);
%                             else
%                                 xviii = xvi;
%                             end;
%                             if xviii < 1
%                                 xxv = xviii + fix(local_window_size / 2);
%                             elseif xviii > size(image, 2)
%                                 xxv = xviii - fix(local_window_size / 2);
%                             else
%                                 xxv = xviii;
%                             end;
%                             evmsum = evmsum + double(image(xxvi, xxv));
%                         end;
%                     end;
%                     evm = evmsum / (local_window_size ^ 2);
% %                     cprintf('Green', '        Calculated mean for estimated variance for each pixel in local window.\n');
% 
%                     
%                     %calculate estimated variance for each pixel in local
%                     %window, also called sample variance
% %                     cprintf('UnterminatedStrings', '        Calculate estimated variance for each pixel in local window...\n');
%                     evsum = 0;
%                     for xix = xi - fix(local_window_size / 2) : xi + fix(local_window_size / 2)
%                         if xix < 1
%                             xxi = xix + fix(local_window_size / 2);
%                         elseif xix > size(image, 1)
%                             xxi = xix - fix(local_window_size / 2);
%                         else
%                             xxi = xix;
%                         end;
%                         if xxi < 1
%                             xxiv = xxi + fix(local_window_size / 2);
%                         elseif xxi > size(image, 1)
%                             xxiv = xxi - fix(local_window_size / 2);
%                         else
%                             xxiv = xxi;
%                         end;
%                         for xx = xii - fix(local_window_size / 2) : xii + fix(local_window_size)
%                             if xx < 1
%                                 xxii = xx + fix(local_window_size / 2);
%                             elseif xx > size(image, 2)
%                                 xxii = xx - fix(local_window_size / 2);
%                             else
%                                 xxii = xx;
%                             end;
%                             if xxii < 1
%                                 xxiii = xxii + fix(local_window_size / 2);
%                             elseif xxii > size(image, 2)
%                                 xxiii = xxii - fix(local_window_size / 2);
%                             else
%                                 xxiii = xxii;
%                             end;
% %                             xx
%                             evsum = evsum + ((double(image(xxiv, xxiii)) - evm) ^ 2);
%                         end;
%                     end;
%                     ev = evmsum / ((local_window_size ^ 2) - 1);
%                     mevsum = mevsum + ev;
% %                     cprintf('Green', '        Calculated estimated variance for each pixel in local window.\n');
%                 end;
%             end;
%             mev = mevsum / (local_window_size ^ 2);
%             pre(i, ii) = m + (((v - mev) * (image(i, ii) - m)) / (v));
% %             cprintf('Green', '      Calculated mean of estimated variance of local window.\n');
%         end;
%     end;

    pre = wiener2(image, [3 3]);
    cprintf('Green', '      Gatos preprocessing finished.\n');

    cprintf('UnterminatedStrings', '      Sauvola binarization for Gatos binarization started...\n');
    bin_gatos = sauvola(pre, 3);
    cprintf('Green', '      Sauvola binarization for Gatos binarization finished.\n');

end

