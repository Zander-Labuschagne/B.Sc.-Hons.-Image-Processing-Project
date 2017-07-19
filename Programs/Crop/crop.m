% Created by Octave 4.2.1, Thu Jul 13 17:19:56 2017 SAST <zander@ArchLinux>
%pkg load image;

image = imread('PTDC0012.JPG');
image = imresize(image, 0.2);
image_gray = rgb2gray(image);
image_bin = ~im2bw(image);

laplacian = [0 -1 0; -1 4 -1; 0 -1 0];
edge_horizon = [-1 -1 -1; 2 2 2; -1 -1 -1];
edge_vertical = [-1 2 -1; -1 2 -1; -1 2 -1];

image_bin = imfilter(image_bin, laplacian);
image_bin = imfilter(image_bin, edge_horizon);
image_bin = imfilter(image_bin, edge_vertical);

%ones_m = ones(5, 5);
%image_bin = imerode(imdilate(image_bin, ones_m), ones_m);

%figure('Name', 'Grayscale Image', 'NumberTitle', 'off');
%imshow(image_gray);
figure('Name', 'Binary Image', 'NumberTitle', 'off');
imshow(image_bin);

draw_lines(image_bin);