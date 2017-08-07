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

skew_tolerance = 2;
line_length_tolerance = 0.2;
page_border_limit = 0.4;

%% --------------------------Vertical Lines-------------------------- %%
line_weight = 0;
skew_detect = 1;
li = 1;
line_index = double(size(image_bin, 2));

i = round(page_border_limit * size(image_bin, 2));
while i > 0
     ii = round(0.5 * size(image_bin, 1) - line_length_tolerance * size(image_bin, 1) / 2);
     while ii <= round(0.5 * size(image_bin, 1) + line_length_tolerance * size(image_bin, 1) / 2)
        if image_bin(ii, i) == 1
            line_weight = line_weight + 1;
            line_index(li) = i;
            li = li + 1;
        else
            iii = 1;
            while (skew_detect == 1) && (iii <= skew_tolerance)%Check for skew lines
                if i + iii < size(image_bin, 2) %If skew detection is in bounds of image
                    if image_bin(ii, i + iii) == 1 %If detected skew to right
                        i = i + iii;
                        skew_detect = 0;
                        line_weight = line_weight + 1;
                        line_index(li) = i;
                        li = li + 1;
                    end;
                elseif i - iii > 0  %If skew detection is in bounds of image
                    if image_bin(ii, i - iii) == 1 %If detected skew to left
                        i = i - iii;
                        skew_detect = 0;
                        line_weight = line_weight + 1;
                        line_index(li) = gobjects(size(image_bin, 2));
                        li = li + 1;
                    end;
                end;
                iii = iii + 1;
            end;%Check for skew lines
        end;
        if skew_detect == 0 %If continuing
            skew_detect = 1;
        else%If broken line
            skew_detect = 1;
            line_weight = 0;
            
            line_index(li) = i;
            li = 1;
            ii = round(0.5 * size(image_bin, 1) + line_length_tolerance * size(image_bin, 1) / 2) * 10;%Jump out of ii while loop
        end;
        ii = ii + 1;
    end;%Move vertically through image from line_length_tolerance top to bottom
    i = i - 1;
end;%Move horizontally through image from 40% to the right to left


fprintf('Total Line Weight: %d\n', line_weight);
fprintf('Perc Line Weight: %d\n', line_weight / size(image_bin, 1));


%% --------------------------Horizontal Lines-------------------------- %%


%% ------------------------------Finalize------------------------------ %%

figure('Name', 'Grayscale Image', 'NumberTitle', 'off');
imshow(image_gray);
     