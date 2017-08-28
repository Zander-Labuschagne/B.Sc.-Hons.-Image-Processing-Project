% Created by Octave 4.2.1, Thu Jul 13 17:19:56 2017 SAST <zander@ArchLinux>
% pkg load image;
% !synclient HorizTwoFingerScroll=0

close all;
clear all;

%% -------------------------Image Preperation------------------------- %%

image = imread('PTDC0122.JPG');
image = imresize(image, 0.5);
image_gray = rgb2gray(image);
%% ----------------------Wiener Low Pass Filter---------------------- %%
%Maak glad en mooi, steek lyne weg
%Werk mooi
%122
%image_wiener2 = wiener2(image_gray,[10 10]);
%figure('Name', 'Wiener2', 'NumberTitle', 'off');
%imshow(image_wiener2);


%% -----------------------Median Low Pass Filter----------------------- %%
% Kan dalk probleme kry by ligte beelde en dun strokes -> maak strokes
% dunner
% Verbeter skadu
%Verbeter bleedthrough
% Verbeter kraak lyne
%Kan dalk gebruik word in cropping? Omdat ink ligter word
% 55, 122 goeie voorbeeld
%image_median = medfilt2(image_gray);
%imshow(image_median);

%% ---------------------Low Pass Butterworth Filter-------------------- %%
%Nie so goed -> Navors dalk vir beter waardes
%Stadig
 image_butterworth = butterworthbpf(image_gray, 30, 120, 2);
 figure('Name', 'Butterworth', 'NumberTitle', 'off');
 imshow(image_butterworth);

%% -----------------------Ideal Low Pass Filter---------------------- %%
%Los veroorsaak ringing, word vervang deur butterworth
%image_ideal = IdealLowPass(image_gray, pi);
%figure('Name', 'Ideal', 'NumberTitle', 'off');
%imshow(image_ideal);

%% ------------------------------Finalize------------------------------ %%
figure('Name', 'Original', 'NumberTitle', 'off');
imshow(image_gray);
     