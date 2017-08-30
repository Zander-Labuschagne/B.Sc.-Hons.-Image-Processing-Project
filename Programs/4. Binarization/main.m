% Created by Octave 4.2.1, Thu Jul 13 17:19:56 2017 SAST <zander@ArchLinux>
% pkg load image;
% !synclient HorizTwoFingerScroll=0

close all;
clear all;

%% -------------------------Image Preperation------------------------- %%
image = imread('PTDC0120.JPG');
image = imresize(image, 0.5);%onthou om te mention
image_gray = rgb2gray(image);%onthou om te mention


% %% ---------------------------Pre-Filtering---------------------------- %%
% disp('  Pre-Filtering started...');
%     %Vat inligting/voorgrond effens weg -> hou maar by oorspronklik
%     %% ---------------------Wiener Low Pass Filter--------------------- %%
%     disp('    Wiener Low Pass Filter started...');
%     prep_wiener = wiener2(image_gray,[2 2]);
%     disp('    Wiener Low Pass Filter completed.');
%     %% ---------------------Median Low Pass Filter--------------------- %%
%     disp('    Median Low Pass Filter started...');
%     %Beste buiten oorspronklik
%     prep_median = medfilt2(image_gray);
%     disp('    Median Low Pass Filter completed.');
%     %% -------------------Low Pass Butterworth Filter------------------ %%
%     disp('    Butterworth Low Pass Filter started...');
%     %Stadig
%     prep_butterworth = butterworthbpf(image_gray, 300, 1, 1);
%     disp('    Butterworth Low Pass Filter completed.');
%     %% --------------------Gaussian Filter-----------------------------%%
%     disp('    Gaussian Low Pass Filter started...');
%     prep_gauss = imgaussfilt(image_gray);
%     disp('    Gaussian Low Pass Filter completed.');
%     %% --------------------Wavelet Transform-------------------------%%
%       
% disp('  Pre-Filtering completed.');


%% ------------------------------Binarize------------------------------ %%
cprintf('Keywords', '  Binarization started...\n');
     %% -------------------------Rosenfeld------------------------ %%
     %bin-rosenfeld = 
     %% -------------------------Otsu------------------------ %%
%      disp('    Otsu binarization started...');
%      bin_otsu = imbinarize(image_gray);
%      prep_gauss_bin_otsu = imbinarize(prep_gauss);
%      prep_butterworth_bin_otsu = imbinarize(prep_butterworth);
%      prep_median_bin_otsu = imbinarize(prep_median);
%      prep_wiener_bin_otsu = imbinarize(prep_wiener);
%      
%      path = 'prep/otsu/8/';
%      imwrite(bin_otsu, strcat(path, 'bin-otsu.png'));
%      imwrite(prep_gauss_bin_otsu, strcat(path, 'prep-gauss_bin-otsu.png'));
%      imwrite(prep_butterworth_bin_otsu, strcat(path, 'prep-butterworth_bin-otsu.png'));
%      imwrite(prep_median_bin_otsu, strcat(path, 'prep-median_bin-otsu.png'));
%      imwrite(prep_wiener_bin_otsu, strcat(path, 'prep-wiener_bin-otsu.png'));
%   
%      disp('    Otsu binarization completed.');


     %% ------------------------Niblack-----------------------%%
     %Slower
     %Check each window with noise removal filters
     cprintf('Keywords', '    Niblack binarization started...\n');
     bin_niblack_3 = niblack(image_gray, 3);
     bin_niblack_5 = niblack(image_gray, 5);
     bin_niblack_7 = niblack(image_gray, 7);
     bin_niblack_9 = niblack(image_gray, 9);
     bin_niblack_11 = niblack(image_gray, 11);
     bin_niblack_13 = niblack(image_gray, 13);
     bin_niblack_15 = niblack(image_gray, 15);
     bin_niblack_17 = niblack(image_gray, 17);
     
     path = 'bin/niblack/6/';
     imwrite(bin_niblack_3, strcat(path, 'bin_niblack_3.png'));
     imwrite(bin_niblack_5, strcat(path, 'bin_niblack_5.png'));
     imwrite(bin_niblack_7, strcat(path, 'bin_niblack_7.png'));
     imwrite(bin_niblack_9, strcat(path, 'bin_niblack_9.png'));
     imwrite(bin_niblack_11, strcat(path, 'bin_niblack_11.png'));
     imwrite(bin_niblack_13, strcat(path, 'bin_niblack_13.png'));
     imwrite(bin_niblack_15, strcat(path, 'bin_niblack_15.png'));
     imwrite(bin_niblack_17, strcat(path, 'bin_niblack_17.png'));
%      
%     prep_gauss_bin_niblack = imbinarize(prep_gauss);
%     prep_butterworth_bin_otsu = imbinarize(prep_butterworth);
%     prep_median_bin_otsu = imbinarize(prep_median);
%     prep_wiener_bin_otsu = imbinarize(prep_wiener);
     
%     imwrite(bin_otsu, 'prep/otsu/8.bin-otsu.png');
%     imwrite(prep_gauss_bin_otsu, 'prep/otsu/8.prep-gauss_bin-otsu.png');
     
%     imwrite(prep_butterworth_bin_otsu, 'prep/otsu/8.prep-butterworth_bin-otsu.png');
     
%     imwrite(prep_median_bin_otsu, 'prep/otsu/8.prep-median_bin-otsu.png');
     
%     imwrite(prep_wiener_bin_otsu, 'prep/otsu/8.prep-wiener_bin-otsu.png');
  
     cprintf('Strings', '    Niblack binarization completed.\n');
%      image_bin_otsu_wiener = imbinarize(image_filter_wiener);
%      image_bin_otsu_butt = imbinarize(image_filter_butterworth);
%      image_bin_otsu_median = imbinarize(image_filter_median);
     
     %% --------------------MATLAB Adaptive-------------------- %%
     %image_bin_adapt = imbinarize(image_gray, 'adaptive');
     
cprintf('Strings', '  Binarization completed.\n');
     
     
     
%% --------------------------Post-Filtering--------------------------- %%
      %Hou maar by original
      %Werk nie
     %image_bin_filter_wiener5 = wiener2(image_bin_niblack_5,[5 5]);
     %image_bin_filter_wiener9 = wiener2(image_bin_niblack_5,[9 9]);
     %image_bin_filter_wiener15 = wiener2(image_bin_niblack_5,[15 15]);

%     %% -----------------Median Low Pass Filter----------------- %%
     %image_bin_filter_median = medfilt2(image_bin_niblack_5);
%     %% ---------------Low Pass Butterworth Filter-------------- %%
     %image_bin_filter_butterworth = butterworthbpf(image_bin_niblack_5, 100, 1, 8);

%% ------------------------------Finalize------------------------------ %%

cprintf('Comments', 'Done.\n');

     