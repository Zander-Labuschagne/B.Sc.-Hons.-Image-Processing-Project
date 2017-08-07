% Created by Octave 4.2.1, Thu Jul 13 17:19:56 2017 SAST <zander@ArchLinux>
% pkg load image;
% !synclient HorizTwoFingerScroll=0

close all;
clear all;

%% -------------------------Image Preperation------------------------- %%

image = imread('PTDC0012.JPG');
image_gray = rgb2gray(image);
image = imresize(image_gray, 0.2);
image_bin = ~im2bw(image);

fprintf('\nImage Size: %d x %d\n', size(image_gray, 2), size(image_gray, 1));

%% -----------------------Preprocessing Filters----------------------- %%
%Laplacian
%laplacian = [0 -1 0; -1 4 -1; 0 -1 0];
%image_bin_laplace = imfilter(image_bin, laplacian);
image_bin_laplace = image_bin;
%Edge enhancement
%edge_horizon = [-1 -1 -1; 2 2 2; -1 -1 -1];
%edge_vertical = [-1 2 -1; -1 2 -1; -1 2 -1];
%image_bin_edge = imfilter(image_bin_laplace, edge_horizon);
%image_bin_edge = imfilter(image_bin_laplace, edge_vertical);
%Open/Close
%ones_m = ones(5, 5);
%image_bin_morph = imerode(imdilate(image_bin_edge, ones_m), ones_m);

figure('Name', 'Binary Image', 'NumberTitle', 'off');
imshow(image_bin_laplace);
%figure('Name', 'Grayscale Image', 'NumberTitle', 'off');
%imshow(image_gray);

skew_tolerance = 20;
line_length_tolerance = 0.3;

%% --------------------------Vertical Lines-------------------------- %%

%Connectedness property
density = 0;
index = 473;
inc_i = -1;
%for i = 1 : inc_i : size(image_bin, 2)
for i = round(size(image_bin, 2) * 0.4) : inc_i : 1
    original_i = i;
    inc_i = -1;
    inc_ii = 1;
    for ii = round(line_length_tolerance .* size(image_bin, 1)) : inc_ii : round((1 - line_length_tolerance) .* size(image_bin, 1))
        ii
        inc_iii = 1;
        for iii = 0 : inc_iii : skew_tolerance
            if(i - iii > 0 && i + iii <= size(image_bin, 2) && (image_bin(ii, i - iii) == 1 || image_bin(ii, i + iii) == 1))
                density = density + 1;
                if(ii == 0)
                    inc_i = -1;
                elseif(image_bin(ii, i - iii) == 1)
                    inc_i = -iii;
                elseif(image_bin(ii, i + iii))
                    inc_i = iii;
                end;
                inc_iii = skew_tolerance * 2;
            end;
        end;
        inc_ii = round((1 - line_length_tolerance) .* size(image_bin, 1)) * 2;%Then the line does not continue further
    end;
    %if(density / size(image_bin, 1) > line_length_tolerance)
    if(density / size(image_bin, 1) >= (1 - 2 * line_length_tolerance))
        fprintf('Density Count: %d\n', density);
        fprintf('Density Value: %d\n', density / size(image_bin, 1));
        index = round(i / 5);
        %Trek Eerste Lyn
        for iv = 1 : size(image_gray, 1)
            image_gray(iv, index) = 255;
            for v = 1 : 7
                image_gray(iv, index + v) = 255;
                if(index - v > 0)
                    image_gray(i, index - v) = 255;
                end;
            end;
        end;
        
        
        break;
    end;
    density = 0;
    i = original_i;
end;

fprintf('Left Index: %d\n', index);
fprintf('Right Index: %d\n', index);


%% --------------------------Horizontal Lines-------------------------- %%


%% ------------------------------Finalize------------------------------ %%

figure('Name', 'Grayscale Image', 'NumberTitle', 'off');
imshow(image_gray);
     