% Created by Octave 4.2.1, Thu Jul 13 17:19:56 2017 SAST <zander@ArchLinux>
% pkg load image;
% !synclient HorizTwoFingerScroll=0

close all;
clear all;

%% -------------------------Image Preperation------------------------- %%
image = imread('PTDC0111.JPG');
image = imresize(image, 0.5);
image_gray = rgb2gray(image);


%% ---------------------------Pre-Filtering---------------------------- %%
    %Vat inligting weg -> hou maar by oorspronklik
    %% ---------------------Wiener Low Pass Filter--------------------- %%
%     image_filter_wiener = wiener2(image_gray,[2 2]);
%     %% ---------------------Median Low Pass Filter--------------------- %%
%     %Beste buiten oorspronklik
%     image_filter_median = medfilt2(image_gray);
%     %% -------------------Low Pass Butterworth Filter------------------ %%
%     image_filter_butterworth = butterworthbpf(image_gray, 300, 1, 1);


%% ------------------------------Binarize------------------------------ %%
    %% -------------------------Rosenfeld------------------------ %%
     %image_rosenfeld = 
     %% -------------------------Otsu------------------------ %%
     image_bin_otsu = imbinarize(image_gray);
%      image_bin_otsu_wiener = imbinarize(image_filter_wiener);
%      image_bin_otsu_butt = imbinarize(image_filter_butterworth);
%      image_bin_otsu_median = imbinarize(image_filter_median);
     
     %% --------------------MATLAB Adaptive-------------------- %%
     %image_bin_adapt = imbinarize(image_gray, 'adaptive');
     
%% --------------------------Post-Filtering--------------------------- %%
      %Hou maar by original
      %Werk nie
%     image_bin_filter_wiener = wiener2(image_bin_otsu,[5 5]);
%     %% -----------------Median Low Pass Filter----------------- %%
%     image_bin_filter_median = medfilt2(image_bin_otsu);
%     %% ---------------Low Pass Butterworth Filter-------------- %%
%     image_bin_filter_butterworth = butterworthbpf(image_bin_otsu, 100, 1, 8);


%% ------------------------------Finalize------------------------------ %%
figure('Name', 'Otsu', 'NumberTitle', 'off');
imagesc(image_bin_otsu);
colormap('gray');
figure('Name', 'Wiener -> Otsu', 'NumberTitle', 'off');
imagesc(image_bin_otsu_wiener);
colormap('gray');
figure('Name', 'Butterworth -> Otsu', 'NumberTitle', 'off');
imagesc(image_bin_otsu_butt);
colormap('gray');
figure('Name', 'Median -> Otsu', 'NumberTitle', 'off');
imagesc(image_bin_otsu_median);
colormap('gray');
%figure('Name', 'Adaptive', 'NumberTitle', 'off');
%imshow(image_bin_adapt);
%imagesc(image_bin_adapt);
%colormap('gray');
     