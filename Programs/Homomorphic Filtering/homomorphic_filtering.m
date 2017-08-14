% Created by Octave 4.2.1, Thu Jul 13 17:19:56 2017 SAST <zander@ArchLinux>
% pkg load image;
% !synclient HorizTwoFingerScroll=0

close all;
clear all;

template = imread('IMG_0164.JPG');
image = imread('IMG_0207.JPG');
image = rgb2gray(image);
template = rgb2gray(template);

%image_R = image ./ template;

for i = 1 : size(image, 1)
    for ii = 1 : size(image, 2)
         a = double(template(i, ii)) / 255;
          %a = double(template(i, ii)) / 255;
         image_R(i, ii) = (image(i, ii) * a);
    end;
end;

image_R = image_R;

figure('Name', 'Template', 'NumberTitle', 'off');
imshow(template);
figure('Name', 'Original', 'NumberTitle', 'off');
imshow(image);
figure('Name', 'R Part', 'NumberTitle', 'off');
imshow(image_R);
     




     