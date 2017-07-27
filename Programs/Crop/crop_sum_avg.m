% Created by Octave 4.2.1, Thu Jul 13 17:19:56 2017 SAST <zander@ArchLinux>
% pkg load image;
% !synclient HorizTwoFingerScroll=0

close all;
clear all;

%% -------------------------Image Preperation------------------------- %%

image = imread('PTDC0029.JPG');
image_gray = rgb2gray(image);
image = imresize(image, 0.2);
image_bin = ~im2bw(image);

fprintf('\nImage Size: %d x %d\n', size(image_gray, 2), size(image_gray, 1));

%% -----------------------Preprocessing Filters----------------------- %%
%Laplacian
laplacian = [0 -1 0; -1 4 -1; 0 -1 0];
image_bin_laplace = imfilter(image_bin, laplacian);
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

%% --------------------------Vertical Lines-------------------------- %%

vtolerance = 1.68;
vtolerance = 1.2;
%vtolerance = 2.5;

%Calculate sum of vertical pixel values
sum = 0;
for iii = 1 : size(image_bin, 2)
    for iv = 1 : size(image_bin, 1)
        sum = sum + image_bin_laplace(iv, iii);
    end;
    vertical_sum(iii) = sum;
    sum = 0;
end;
   
%Calculate the average of the sum of the vertical pixels
sum = 0;
for vi = 1 : size(vertical_sum, 2)
    sum = sum + vertical_sum(vi);
end;
avg = sum ./ size(vertical_sum, 2);
fprintf('Vertical Sum Average: %f\n', avg);

index = 1;
%Calculate index of left vertical line
for v = size(vertical_sum, 2) / 2 : -1 : 1
    if (vertical_sum(v) > (avg + vtolerance .* avg))
        index = v;
        break;
    end;
end;
index = index .* 5;

figure('Name', 'Vertical Sum', 'NumberTitle', 'off');
plot(vertical_sum);

fprintf('Left Index: %d\n', index);

%Draw left vertical line
for i = 1 : size(image_gray, 1)
    image_gray(i, index) = 255;
    for ii = 1 : 7
        image_gray(i, index + ii) = 255;
        if index - ii > 0
            image_gray(i, index - ii) = 255;
        end;
    end;
end;

%Find index to draw right vertical line
for v = size(vertical_sum, 2) - size(vertical_sum, 2) / 2 : size(vertical_sum, 2)
     if (vertical_sum(v) > avg + vtolerance .* avg)
         index = v;
         break;
     end;
end;
index = index .* 5;

fprintf('Right Index: %d\n', index);

%Draw right vertical line
for vii = 1 : size(image_gray, 1)
    image_gray(vii, index) = 255;
    for viii = 1 : 7
        image_gray(vii, index + viii) = 255;
        image_gray(vii, index - viii) = 255;
    end;
end;

%% --------------------------Horizontal Lines-------------------------- %%

htolerance = 3;

%Calculate sum of horizontal pixel values
sum = 0;
for ix = 1 : size(image_bin, 1)
    for x = 1 : size(image_bin, 2)
        sum = sum + image_bin_laplace(ix, x);
    end;
    horizontal_sum(ix) = sum;
    sum = 0;
end;

%Calculate the average of the sum of the horizontal pixels
sum = 0;
for xi = 1 : size(horizontal_sum, 2)
    sum = sum + horizontal_sum(xi);
end;
avg = sum ./ size(horizontal_sum, 2);
fprintf('Horizontal Sum Average: %f\n', avg);

%Calculate index of upper horizontal line
index = 1;
for xii = round(size(horizontal_sum, 2) / 2) : -1 : 1
    if (horizontal_sum(xii) > (avg + htolerance .* avg))
        index = xii;
        break;
    end;
end;
index = index .* 5;

figure('Name', 'Horizontal Sum', 'NumberTitle', 'off');
plot(horizontal_sum);

fprintf('Upper Index: %d\n', index);

%Draw upper horizontal line
for xiii = 1 : size(image_gray, 2)
    image_gray(index, xiii) = 255;
    for xiv = 1 : 7
        image_gray(index + xiv, xiii) = 255;
        if(index - xiv > 0)
            image_gray(index - xiv, xiii) = 255;
        end;
    end;
end;

%Find index to draw lower horizontal line
index = 1;
for xv = round(size(horizontal_sum, 2) - size(horizontal_sum, 2) / 2) : size(horizontal_sum, 2)
     if (horizontal_sum(xv) > avg + htolerance .* avg)
         index = xv;
         index
         break;
     end;
end;
index = index .* 5;

fprintf('Lower Index: %d\n', index);

%Draw lower horizontal line
for xvi = 1 : size(image_gray, 2)
    image_gray(index, xvi) = 255;
    for xvii = 1 : 7
        image_gray(index + xvii, xvi) = 255;
        if(index - xvii > 0)
            image_gray(index - xvii, xvi) = 255;
        end;
    end;
end;

%% ------------------------------Finalize------------------------------ %%

figure('Name', 'Grayscale Image', 'NumberTitle', 'off');
imshow(image_gray);
     