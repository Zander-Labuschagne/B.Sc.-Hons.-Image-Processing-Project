im = imread('PTDC0055.jpg');
im = imresize(im, 0.5);
im = rgb2gray(im);
imwrite(im, 'gray.png');