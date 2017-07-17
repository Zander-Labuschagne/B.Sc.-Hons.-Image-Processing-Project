# Created by Octave 4.2.1, Thu Jul 13 17:19:56 2017 SAST <zander@ArchLinux>
pkg load image;

image = imread('PTDC0012.JPG');
image = imresize(image, 0.2);
image_gray = rgb2gray(image);
image_bin = ~im2bw(image);

sum = 0;

for i = 1 : size(image, 1)
  for ii = 1 : size(image, 2)
    sum = sum + image_bin(i, ii);
  end;
  horizontal_sum(i) = sum;
  horizontal_avg(i) = sum / size(image, 2);
  sum = 0;
end;

for iii = 1 : size(image, 2)
  for iv = 1 : size(image, 1)
    sum = sum + image_bin(iv, iii);
  end;
  vertical_sum(iii) = sum;
  vertical_avg(iii) = sum / size(image, 1);
  sum = 0;
end;

figure('Name', 'Horizontal Sum', 'NumberTitle', 'off');
plot(horizontal_sum);
figure('Name', 'Horizontal Average', 'NumberTitle', 'off');
plot(horizontal_avg);
figure('Name', 'Grayscale Image', 'NumberTitle', 'off');
imshow(image_gray);
figure('Name', 'Binary Image', 'NumberTitle', 'off');
imshow(image_bin);
figure('Name', 'Vertical Sum', 'NumberTitle', 'off');
plot(vertical_sum);
figure('Name', 'Vertical Average', 'NumberTitle', 'off');
plot(vertical_avg);