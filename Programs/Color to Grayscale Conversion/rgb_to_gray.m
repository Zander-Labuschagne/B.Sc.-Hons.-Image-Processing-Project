# Created by Octave 4.2.1, Thu Jul 13 17:19:56 2017 SAST <zander@ArchLinux>
pkg load image;

#images = dir('PTDC00*.JPG');
#for i = 12 : length(images)
#  filename = strcat('', images(i - 12).name);
#  image = imread(filename);
#  gimage = rgb2gray(image);
#  imwrite(gimage, strcat('gray_00', i - 12, '.JPG'));
#end;

image = imread('PTDC0012.JPG');
gimage = rgb2gray(image);
imwrite(gimage, '1.JPG');

disp('Done');