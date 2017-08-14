% Created by Octave 4.2.1, Thu Jul 13 17:19:56 2017 SAST <zander@ArchLinux>
% pkg load image;
% !synclient HorizTwoFingerScroll=0

close all;
clear all;

%% -------------------------Image Preperation------------------------- %%

image = imread('PTDC0015.JPG');
image = imresize(image, 0.25);
image_gray = rgb2gray(image);
%% ----------------------Wiener Low Pass Filter---------------------- %%


%% -----------------------Median Low Pass Filter----------------------- %%
image_median = medfilt2(image_gray);
imshowpair(image_gray, image_median, 'montage');

%% ---------------------Low Pass Butterworth Filter-------------------- %%


%% -----------------------Ideal Low Pass Filter---------------------- %%


%% ------------------------------Finalize------------------------------ %%

     