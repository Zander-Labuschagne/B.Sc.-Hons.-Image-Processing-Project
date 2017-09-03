% Created by Octave 4.2.1, Thu Jul 13 17:19:56 2017 SAST <zander@ArchLinux>
% pkg load image;
% !synclient HorizTwoFingerScroll=0

close all;
clear all;

%% -------------------------Image Preperation------------------------- %%
image = imread('PTDC0121.JPG');
image = imresize(image, 0.5);
image_gray = rgb2gray(image);


 %% ---------------------------Pre-Filtering---------------------------- %%
 cprintf('UnterminatedStrings', '  Pre-Filtering started...\n');
     %% ---------------------Wiener Low Pass Filter--------------------- %%
%      cprintf('Black', '    Wiener Low Pass Filter started...\n');
%      prep_wiener_5 = wiener2(image_gray, [5 5]);
%      prep_wiener_7 = wiener2(image_gray, [7 7]);
%      prep_wiener_9 = wiener2(image_gray, [9 9]);
%      prep_wiener_11 = wiener2(image_gray, [11 11]);
%      prep_wiener_13 = wiener2(image_gray, [13 13]);
%      cprintf('Blue', '    Wiener Low Pass Filter completed.\n');

     %% ---------------------Median Low Pass Filter--------------------- %%
%      cprintf('Black', '    Median Low Pass Filter started...\n');
%      prep_median = medfilt2(image_gray);
%      cprintf('Blue', '    Median Low Pass Filter completed.\n');

     %% -------------------Low Pass Butterworth Filter------------------ %%
     cprintf('Black', '    Butterworth Low Pass Filter started...\n');
     prep_butterworth_5_1 = butterworthbpf(image_gray, 5, 1, 1);
     prep_butterworth_20_1 = butterworthbpf(image_gray, 20, 1, 1);
     prep_butterworth_100_1 = butterworthbpf(image_gray, 100, 1, 1);
     prep_butterworth_200_1 = butterworthbpf(image_gray, 200, 1, 1);
     prep_butterworth_300_1 = butterworthbpf(image_gray, 300, 1, 1);
     prep_butterworth_500_1 = butterworthbpf(image_gray, 500, 1, 1);
     cprintf('Blue', '    Butterworth Low Pass Filter completed.\n');

     %% --------------------Gaussian Low Pass Filter-------------------- %%
%      cprintf('Black', '    Gaussian Low Pass Filter started...\n');
%      prep_gauss = imgaussfilt(image_gray);
%      cprintf('Blue', '    Gaussian Low Pass Filter completed.\n');
     %% --------------------Wavelet Transform-------------------------%%
       
 cprintf('Strings', '  Pre-Filtering completed.\n');



%% ------------------------------Binarize------------------------------ %%
cprintf('UnterminatedStrings', '  Binarization started...\n');
     %% -------------------------Rosenfeld------------------------ %%
     %bin-rosenfeld = 
     %% -------------------------Otsu------------------------ %%
%      cprintf('Black', '    Otsu binarization started...\n');
%      bin_otsu = imbinarize(image_gray);
%      prep_gauss_bin_otsu = imbinarize(prep_gauss);
%      prep_butterworth_bin_otsu = imbinarize(prep_butterworth);
%      prep_median_bin_otsu = imbinarize(prep_median);
%      prep_wiener_bin_otsu = imbinarize(prep_wiener);
%      
%      path = 'bin/otsu/';
%      imwrite(bin_otsu, strcat(path, '6.bin-otsu.png'));
%      imwrite(prep_gauss_bin_otsu, strcat(path, 'prep-gauss_bin-otsu.png'));
%      imwrite(prep_butterworth_bin_otsu, strcat(path, 'prep-butterworth_bin-otsu.png'));
%      imwrite(prep_median_bin_otsu, strcat(path, 'prep-median_bin-otsu.png'));
%      imwrite(prep_wiener_bin_otsu, strcat(path, 'prep-wiener_bin-otsu.png'));
%   
%     cprintf('Blue', '    Otsu binarization completed.\n');


     %% ------------------------Niblack-----------------------%%
     %Local window size of 11 is optimal
      cprintf('Black', '    Niblack binarization started...\n');
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
%      prep_gauss_bin_niblack_11 = niblack(prep_gauss, 11);
%      prep_median_bin_niblack_11 = niblack(prep_median, 11);
%      prep_wiener_5_bin_niblack_11 = niblack(prep_wiener_5, 11);
%      prep_wiener_7_bin_niblack_11 = niblack(prep_wiener_7, 11);
%      prep_wiener_9_bin_niblack_11 = niblack(prep_wiener_9, 11);
%      prep_wiener_11_bin_niblack_11 = niblack(prep_wiener_11, 11);
%      prep_wiener_13_bin_niblack_11 = niblack(prep_wiener_13, 11);
       prep_butterworth_5_1_bin_niblack_11 = niblack(prep_butterworth_5_1, 11);
       prep_butterworth_20_1_bin_niblack_11 = niblack(prep_butterworth_20_1, 11);
       prep_butterworth_100_1_bin_niblack_11 = niblack(prep_butterworth_100_1, 11);
       prep_butterworth_200_1_bin_niblack_11 = niblack(prep_butterworth_200_1, 11);
       prep_butterworth_300_1_bin_niblack_11 = niblack(prep_butterworth_300_1, 11);
       prep_butterworth_500_1_bin_niblack_11 = niblack(prep_butterworth_500_1, 11);

     path = 'prep/niblack/1/';
%      imwrite(bin_niblack_11, strcat(path, 'bin-niblack_11.png'));
%      imwrite(prep_gauss_bin_niblack_11, strcat(path, 'prep-gauss_bin-niblack_11.png'));
%      imwrite(prep_butterworth_bin_niblack_11, strcat(path, 'prep-butterworth_bin-niblack_11.png'));
%      imwrite(prep_median_bin_niblack_11, strcat(path, 'prep-median_bin-niblack_11.png'));
%       imwrite(prep_wiener_5_bin_niblack_11, strcat(path, 'prep-wiener_5_bin-niblack_11.png'));
%       imwrite(prep_wiener_7_bin_niblack_11, strcat(path, 'prep-wiener_7_bin-niblack_11.png'));
%       imwrite(prep_wiener_9_bin_niblack_11, strcat(path, 'prep-wiener_9_bin-niblack_11.png'));
%       imwrite(prep_wiener_11_bin_niblack_11, strcat(path, 'prep-wiener_11_bin-niblack_11.png'));
%       imwrite(prep_wiener_13_bin_niblack_11, strcat(path, 'prep-wiener_13_bin-niblack_11.png'));
imwrite(prep_butterworth_5_1_bin_niblack_11, strcat(path, 'prep-butterworth_5_1_bin-niblack_11.png'));
imwrite(prep_butterworth_20_1_bin_niblack_11, strcat(path, 'prep-butterworth_20_1_bin-niblack_11.png'));
imwrite(prep_butterworth_100_1_bin_niblack_11, strcat(path, 'prep-butterworth_100_1_bin-niblack_11.png'));
imwrite(prep_butterworth_200_1_bin_niblack_11, strcat(path, 'prep-butterworth_200_1_bin-niblack_11.png'));
imwrite(prep_butterworth_300_1_bin_niblack_11, strcat(path, 'prep-butterworth_300_1_bin-niblack_11.png'));
imwrite(prep_butterworth_500_1_bin_niblack_11, strcat(path, 'prep-butterworth_500_1_bin-niblack_11.png'));
  
cprintf('Blue', '    Niblack binarization completed.\n');
     
     %% --------------------MATLAB Adaptive-------------------- %%
     %image_bin_adapt = imbinarize(image_gray, 'adaptive');
     
cprintf('Strings', '  Binarization completed.\n');
     
     
     
%% --------------------------Post-Filtering--------------------------- %%
%cprintf('UnterminatedStrings', '  Post-Filtering started...\n');

     %% ---------------------Wiener Low Pass Filter--------------------- %%
            %% -------------------Otsu-------------------- %%     
%     cprintf('Black', '    Wiener Low Pass Filter started...\n');
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
%     bin_niblack_11 = imread('bin/niblack/6/bin_niblack_11.png');
%      bin_niblack_11_post_wiener_3 = wiener2(bin_niblack_11, [3 3]);
%      bin_niblack_11_post_wiener_5 = wiener2(bin_niblack_11, [5 5]);
%      bin_niblack_11_post_wiener_7 = wiener2(bin_niblack_11, [7 7]);
%      bin_niblack_11_post_wiener_9 = wiener2(bin_niblack_11, [9 9]);
%      bin_niblack_11_post_wiener_11 = wiener2(bin_niblack_11, [11 11]);
%      bin_niblack_11_post_wiener_13 = wiener2(bin_niblack_11, [13 13]);
%      bin_niblack_11_post_wiener_15 = wiener2(bin_niblack_11, [15 15]);
%     bin_niblack_11_post_wiener_17 = wiener2(bin_niblack_11, [17 17]);
%      bin_niblack_11_post_wiener_19 = wiener2(bin_niblack_11, [19 19]);
%      bin_niblack_11_post_wiener_21 = wiener2(bin_niblack_11, [21 21]);
%      bin_niblack_11_post_wiener_23 = wiener2(bin_niblack_11, [23 23]);
     
%     bin_niblack_11_post_wiener_17_bin_otsu = imbinarize(bin_niblack_11_post_wiener_17);
%     imwrite(bin_niblack_11_post_wiener_17_bin_otsu, 'post/niblack/11/wiener/bin_otsu/6.bin_niblack_11_post_wiener_17_bin_otsu.png');
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
%      cprintf('Blue', '    Wiener Low Pass Filter completed.\n');

%     %% -----------------Median Low Pass Filter----------------- %%
     %image_bin_filter_median = medfilt2(image_bin_niblack_5);
%     %% ---------------Low Pass Butterworth Filter-------------- %%
     %image_bin_filter_butterworth = butterworthbpf(image_bin_niblack_5, 100, 1, 8);
        %  bin_niblack_11_post_gauss = 
% cprintf('Strings', '  Post-Filtering Completed.\n');


%% ------------------------------Finalize------------------------------ %%

cprintf('Comments', 'Done.\n');

     