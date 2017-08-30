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
%cprintf('Keywords', '  Binarization started...\n');
     %% -------------------------Rosenfeld------------------------ %%
     %bin-rosenfeld = 
     %% -------------------------Otsu------------------------ %%
%      cprintf('Keywords', '    Otsu binarization started...\n');
%      bin_niblack_11 = imbinarize(image_gray);
%      prep_gauss_bin_niblack_11 = imbinarize(prep_gauss);
%      prep_butterworth_bin_niblack_11 = imbinarize(prep_butterworth);
%      prep_median_bin_niblack_11 = imbinarize(prep_median);
%      prep_wiener_bin_niblack_11 = imbinarize(prep_wiener);
%      
%      path = 'bin/otsu/';
%      imwrite(bin_niblack_11, strcat(path, '6.bin-otsu.png'));
%      imwrite(prep_gauss_bin_niblack_11, strcat(path, 'prep-gauss_bin-otsu.png'));
%      imwrite(prep_butterworth_bin_niblack_11, strcat(path, 'prep-butterworth_bin-otsu.png'));
%      imwrite(prep_median_bin_niblack_11, strcat(path, 'prep-median_bin-otsu.png'));
%      imwrite(prep_wiener_bin_niblack_11, strcat(path, 'prep-wiener_bin-otsu.png'));
%   
%     cprintf('Strings', '    Otsu binarization completed.\n');


     %% ------------------------Niblack-----------------------%%
     %Slower
     %Check each window with noise removal filters
%      cprintf('Keywords', '    Niblack binarization started...\n');
%      bin_niblack_3 = niblack(image_gray, 3);
%      bin_niblack_5 = niblack(image_gray, 5);
%      bin_niblack_7 = niblack(image_gray, 7);
%      bin_niblack_9 = niblack(image_gray, 9);
%      bin_niblack_11 = niblack(image_gray, 11);
%      bin_niblack_13 = niblack(image_gray, 13);
%      bin_niblack_15 = niblack(image_gray, 15);
%      bin_niblack_17 = niblack(image_gray, 17);
%      
%      path = 'bin/niblack/6/';
%      imwrite(bin_niblack_3, strcat(path, 'bin_niblack_3.png'));
%      imwrite(bin_niblack_5, strcat(path, 'bin_niblack_5.png'));
%      imwrite(bin_niblack_7, strcat(path, 'bin_niblack_7.png'));
%      imwrite(bin_niblack_9, strcat(path, 'bin_niblack_9.png'));
%      imwrite(bin_niblack_11, strcat(path, 'bin_niblack_11.png'));
%      imwrite(bin_niblack_13, strcat(path, 'bin_niblack_13.png'));
%      imwrite(bin_niblack_15, strcat(path, 'bin_niblack_15.png'));
%      imwrite(bin_niblack_17, strcat(path, 'bin_niblack_17.png'));
%      
%     prep_gauss_bin_niblack = imbinarize(prep_gauss);
%     prep_butterworth_bin_niblack_11 = imbinarize(prep_butterworth);
%     prep_median_bin_niblack_11 = imbinarize(prep_median);
%     prep_wiener_bin_niblack_11 = imbinarize(prep_wiener);
     
%     imwrite(bin_niblack_11, 'prep/otsu/8.bin-otsu.png');
%     imwrite(prep_gauss_bin_niblack_11, 'prep/otsu/8.prep-gauss_bin-otsu.png');
     
%     imwrite(prep_butterworth_bin_niblack_11, 'prep/otsu/8.prep-butterworth_bin-otsu.png');
     
%     imwrite(prep_median_bin_niblack_11, 'prep/otsu/8.prep-median_bin-otsu.png');
     
%     imwrite(prep_wiener_bin_niblack_11, 'prep/otsu/8.prep-wiener_bin-otsu.png');
  
%     cprintf('Strings', '    Niblack binarization completed.\n');
     
     %% --------------------MATLAB Adaptive-------------------- %%
     %image_bin_adapt = imbinarize(image_gray, 'adaptive');
     
%cprintf('Strings', '  Binarization completed.\n');
     
     
     
%% --------------------------Post-Filtering--------------------------- %%
cprintf('Keywords', '  Post-Filtering started...\n');

     %% ---------------------Wiener Low Pass Filter--------------------- %%
            %% -------------------Otsu-------------------- %%
     %Otsu: Destroys information/foreground
     
%     cprintf('Keywords', '    Wiener Low Pass Filter started...\n');
%      bin_otsu = ~imread('bin/otsu/6.bin-otsu.png');
%      bin_otsu_post_wiener_3 = wiener2(bin_otsu, [3 3]);
%      bin_otsu_post_wiener_5 = wiener2(bin_otsu, [5 5]);
%      bin_otsu_post_wiener_7 = wiener2(bin_otsu, [7 7]);
%      bin_otsu_post_wiener_9 = wiener2(bin_otsu, [9 9]);
%      bin_otsu_post_wiener_11 = wiener2(bin_otsu, [11 11]);
%      bin_otsu_post_wiener_13 = wiener2(bin_otsu, [13 13]);
%      bin_otsu_post_wiener_15 = wiener2(bin_otsu, [15 15]);
%      
%      path = 'post/otsu/wiener/6/';
%      imwrite(bin_otsu, strcat(path, 'bin_niblack_11.png'));
%      imwrite(bin_otsu_post_wiener_3, strcat(path, 'bin_otsu_post_wiener_3.png'));
%      imwrite(bin_otsu_post_wiener_5, strcat(path, 'bin_otsu_post_wiener_5.png'));
%      imwrite(bin_otsu_post_wiener_7, strcat(path, 'bin_otsu_post_wiener_7.png'));
%      imwrite(bin_otsu_post_wiener_9, strcat(path, 'bin_otsu_post_wiener_9.png'));
%      imwrite(bin_otsu_post_wiener_11, strcat(path, 'bin_otsu_post_wiener_11.png'));
%      imwrite(bin_otsu_post_wiener_13, strcat(path, 'bin_otsu_post_wiener_13.png'));
%      imwrite(bin_otsu_post_wiener_15, strcat(path, 'bin_otsu_post_wiener_15.png'));


            %% ----------------Niblack------------- %%
     %Niblack: Improved, window size 17.
%      bin_niblack_11 = imread('bin/niblack/6/bin_niblack_11.png');
%      bin_niblack_11_post_wiener_3 = wiener2(bin_niblack_11, [3 3]);
%      bin_niblack_11_post_wiener_5 = wiener2(bin_niblack_11, [5 5]);
%      bin_niblack_11_post_wiener_7 = wiener2(bin_niblack_11, [7 7]);
%      bin_niblack_11_post_wiener_9 = wiener2(bin_niblack_11, [9 9]);
%      bin_niblack_11_post_wiener_11 = wiener2(bin_niblack_11, [11 11]);
%      bin_niblack_11_post_wiener_13 = wiener2(bin_niblack_11, [13 13]);
%      bin_niblack_11_post_wiener_15 = wiener2(bin_niblack_11, [15 15]);
%      bin_niblack_11_post_wiener_17 = wiener2(bin_niblack_11, [17 17]);
%      bin_niblack_11_post_wiener_19 = wiener2(bin_niblack_11, [19 19]);
%      bin_niblack_11_post_wiener_21 = wiener2(bin_niblack_11, [21 21]);
%      bin_niblack_11_post_wiener_23 = wiener2(bin_niblack_11, [23 23]);
% 
%      
%      path = 'post/niblack/11/wiener/6/';
%      imwrite(bin_niblack_11, strcat(path, 'bin_niblack_11.png'));
%      imwrite(bin_niblack_11_post_wiener_3, strcat(path, 'bin_niblack_11_post_wiener_3.png'));
%      imwrite(bin_niblack_11_post_wiener_5, strcat(path, 'bin_niblack_11_post_wiener_5.png'));
%      imwrite(bin_niblack_11_post_wiener_7, strcat(path, 'bin_niblack_11_post_wiener_7.png'));
%      imwrite(bin_niblack_11_post_wiener_9, strcat(path, 'bin_niblack_11_post_wiener_9.png'));
%      imwrite(bin_niblack_11_post_wiener_11, strcat(path, 'bin_niblack_11_post_wiener_11.png'));
%      imwrite(bin_niblack_11_post_wiener_13, strcat(path, 'bin_niblack_11_post_wiener_13.png'));
%      imwrite(bin_niblack_11_post_wiener_15, strcat(path, 'bin_niblack_11_post_wiener_15.png'));
%      imwrite(bin_niblack_11_post_wiener_17, strcat(path, 'bin_niblack_11_post_wiener_17.png'));
%      imwrite(bin_niblack_11_post_wiener_19, strcat(path, 'bin_niblack_11_post_wiener_19.png'));
%      imwrite(bin_niblack_11_post_wiener_21, strcat(path, 'bin_niblack_11_post_wiener_21.png'));
%      imwrite(bin_niblack_11_post_wiener_23, strcat(path, 'bin_niblack_11_post_wiener_23.png'));
%      
%      cprintf('Strings', '    Wiener Low Pass Filter completed.\n');

%     %% -----------------Median Low Pass Filter----------------- %%
     %image_bin_filter_median = medfilt2(image_bin_niblack_5);
%     %% ---------------Low Pass Butterworth Filter-------------- %%
     %image_bin_filter_butterworth = butterworthbpf(image_bin_niblack_5, 100, 1, 8);
        %  bin_niblack_11_post_gauss = 


%% ------------------------------Finalize------------------------------ %%

cprintf('Comments', 'Done.\n');

     