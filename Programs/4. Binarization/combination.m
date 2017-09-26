
%% -----Weights------%%
sauvola13_weight = 0.33;
niblack13_weight = 0.1;
niblack11_weight = 0.33;
niblack1105_weight = 0.1;
niblack1705_weight = 0.13;
otsu_weight = 0.5;

% final_bin = zeros(size(bin_sauvola_post_median, 1), size(bin_sauvola_post_median, 2));

image = imread('PTDC0012.JPG');
image = imresize(image, 0.25);
image_gray = rgb2gray(image);
bin_final = zeros(size(image_gray, 1), size(image_gray, 2));

for i = 1 : size(image_gray, 1)
    for ii = 1 : size(image_gray, 2)
        %% ------- Saovola 13 -------- %%
        R = 128;
        S = std2(image_gray);
        k = 0.065;
        local_window_size = 13;
        if(i - fix(local_window_size / 2) < 1)
            iii = i + fix(local_window_size / 2);
        elseif(i + fix(local_window_size / 2) > size(image_gray, 1))
            iii = i - fix(local_window_size / 2);
        else
            iii = i;
        end;
        if(ii - fix(local_window_size / 2) < 1)
            iv = ii + fix(local_window_size / 2);
        elseif(ii + fix(local_window_size / 2) > size(image_gray, 2))
            iv = ii - fix(local_window_size / 2);
        else
            iv = ii;
        end;

        local_window = image_gray(iii - fix(local_window_size / 2) : iii + fix(local_window_size / 2), iv - fix(local_window_size / 2) : iv + fix(local_window_size / 2));
        m = mean2(local_window);
        sauvola13_T = m * (1 - k * (1 - S / R));
        
        %% ------ Sauvola 21 ------ %%
        
%         local_window_size = 21;
%         if(i - fix(local_window_size / 2) < 1)
%             iii = i + fix(local_window_size / 2);
%         elseif(i + fix(local_window_size / 2) > size(image_gray, 1))
%             iii = i - fix(local_window_size / 2);
%         else
%             iii = i;
%         end;
%         if(ii - fix(local_window_size / 2) < 1)
%             iv = ii + fix(local_window_size / 2);
%         elseif(ii + fix(local_window_size / 2) > size(image_gray, 2))
%             iv = ii - fix(local_window_size / 2);
%         else
%             iv = ii;
%         end;
% 
%         local_window = image_gray(iii - fix(local_window_size / 2) : iii + fix(local_window_size / 2), iv - fix(local_window_size / 2) : iv + fix(local_window_size / 2));
%         m = mean2(local_window);
%         sauvola21_T = m * (1 - k * (1 - S / R));

        
        %% ------ Niblack 11 ------%%
        msum = 0;
        local_window_size = 11;
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
         k = -0.2;
         niblack11_T = m + k * S;
         k = -0.5;
         niblack1105_T = m + k * S;
         
         %% ----- Niblack 1705 ----- %%
%         msum = 0;
%         local_window_size = 17;
%         for iii = i - fix(local_window_size / 2) : i + fix(local_window_size / 2)
%             if(iii < 1)
%                 v =   + fix(local_window_size / 2);
%             elseif(iii > size(image, 1))
%                 v = iii - fix(local_window_size / 2);
%             else
%                 v = iii;
%             end;
%             for iv = ii - fix(local_window_size / 2) : ii + fix(local_window_size / 2)
%                 if(iv < 1)
%                     vi = iv + fix(local_window_size / 2);
%                 elseif(iv > size(image, 2))
%                     vi = iv - fix(local_window_size / 2);
%                 else
%                     vi = iv;
%                 end;
%                 msum = msum + double(image(v, vi));
%             end;
%          end;
%          m = msum / (local_window_size .^ 2); 
%          k = -0.5;
%          niblack1705_T = m + k * S;
        
                      
        final_T = sauvola13_weight * sauvola13_T + niblack11_weight * niblack11_T + niblack1105_weight * niblack1105_T;

        if(image_gray(i, ii) > final_T)
            bin_final(i, ii) = 255;
        else
            bin_final(i, ii) = 0;
        end;
    end;
    fprintf('Thresholding Progress: %d%%\n', fix(i / size(image_gray, 1) * 100));
end;

load chirp;
sound(y, 2 * Fs);
notify('DONE!', 'MATLAB R2017a', '', 'Sosumi');

imagesc(bin_final);
colormap('gray');