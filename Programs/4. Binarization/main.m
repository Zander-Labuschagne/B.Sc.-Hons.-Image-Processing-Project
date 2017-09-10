% Created by Octave 4.2.1, Thu Jul 13 17:19:56 2017 SAST <zander@ArchLinux>
% pkg load image;
% !synclient HorizTwoFingerScroll=0

close all;
clear all;

%% -------------------------Image Preperation------------------------- %%
image = imread('PTDC0012.JPG');
image = imresize(image, 0.5);
image_gray = rgb2gray(image);



 %% ---------------------------Pre-Filtering---------------------------- %%
%     cprintf('UnterminatedStrings', '  Pre-Binarization Filtering started...\n');

     %% -------------------Wiener Low Pass Filter------------------- %%
%       cprintf('Black', '    Wiener Low Pass Filter started...\n');
%     path = 'prep/filters/wiener/12/';
%        prep_wiener_5 = wiener2(image_gray, [5 5]);
%       prep_wiener_7 = wiener2(image_gray, [7 7]);
%       prep_wiener_9 = wiener2(image_gray, [9 9]);
%      prep_wiener_11 = wiener2(image_gray, [11 11]);
%      prep_wiener_13 = wiener2(image_gray, [13 13]);
     
%      imwrite(prep_wiener_5, strcat(path, 'prep_wiener_5.png'));
%      imwrite(prep_wiener_7, strcat(path, 'prep_wiener_7.png'));
%      imwrite(prep_wiener_9, strcat(path, 'prep_wiener_9.png'));
%      imwrite(prep_wiener_11, strcat(path, 'prep_wiener_11.png'));
%      imwrite(prep_wiener_13, strcat(path, 'prep_wiener_13.png'));

%        cprintf('Blue', '    Wiener Low Pass Filter completed.\n');

     %% ------------------Median Low Pass Filter------------------ %%
%         cprintf('Black', '    Median Low Pass Filter started...\n');
%       path = 'prep/filters/median/';
%          prep_median = medfilt2(image_gray);
%       imwrite(prep_median, strcat(path, '12.prep_median.png'));
%         cprintf('Blue', '    Median Low Pass Filter completed.\n');

     %% -------------------Low Pass Butterworth Filter------------------ %%
%      cprintf('Black', '    Butterworth Low Pass Filter started...\n');
%      path = 'prep/filters/butterworth/1/';
%      prep_butterworth_500_3 = butterworthbpf(image_gray, 0.5, 1, 3);
%      prep_butterworth_1000_3 = butterworthbpf(image_gray, 0.1, 1, 3);
%      prep_butterworth_1500_3 = butterworthbpf(image_gray, 1500, 1, 3);
%      prep_butterworth_2000_3 = butterworthbpf(image_gray, 2000, 1, 3);
%      prep_butterworth_3000_3 = butterworthbpf(image_gray, 3000, 1, 3);
%      prep_butterworth_5000_3 = butterworthbpf(image_gray, 5000, 1, 3);
     
%      imwrite(prep_butterworth_500_3, strcat(path, 'prep_butterworth_500_3.png'));
%      imwrite(prep_butterworth_1000_3, strcat(path, 'prep_butterworth_1000_3.png'));
%      imwrite(prep_butterworth_1500_3, strcat(path, 'prep_butterworth_1500_3.png'));
%      imwrite(prep_butterworth_2000_3, strcat(path, 'prep_butterworth_2000_3.png'));
%      imwrite(prep_butterworth_3000_3, strcat(path, 'prep_butterworth_3000_3.png'));
%      imwrite(prep_butterworth_5000_3, strcat(path, 'prep_butterworth_5000_3.png'));

%      cprintf('Blue', '    Butterworth Low Pass Filter completed.\n');
     

     %% ----------------Gaussian Low Pass Filter------------------ %%
%       cprintf('Black', '    Gaussian Low Pass Filter started...\n');
%      path = 'prep/filters/gauss/';
%       prep_gauss = imgaussfilt(image_gray);
%      imwrite(prep_gauss, strcat(path, '12.prep_gauss.png'));
%       cprintf('Blue', '    Gaussian Low Pass Filter completed.\n');
     %% --------------------Wavelet Transform-------------------------%%
       
%    cprintf('Strings', '  Pre-Binarization Filtering completed.\n');



%% ------------------------------Binarize------------------------------ %%
 cprintf('UnterminatedStrings', '  Binarization started...\n');
 
    %% ------------------------ Global Average --------------------- %%
%         cprintf('Black', '    Average binarization started...\n');
%         bin_avg = avgbin(image_gray);
%         imwrite(bin_avg, 'bin/average/12.bin_avg.png');
%         cprintf('Blue', '    Average binarization completed.\n');
        
     %% ------------------------ Global Median --------------------- %%
%         cprintf('Black', '    Median binarization started...\n');
%         bin_med = medbin(image_gray, 8);
%         imwrite(bin_med, 'bin/median/8/2.bin_med.png');
%         cprintf('Blue', '    Median binarization completed.\n');
    
     %% -------------------------Rosenfeld------------------------ %%
     %bin-rosenfeld = 
     %% ---------------------------Otsu-------------------------- %%
%       cprintf('Black', '    Otsu binarization started...\n');
%       bin_otsu = imbinarize(image_gray);
%      prep_butterworth_bin_otsu = imbinarize(prep_butterworth);
%      prep_gauss_bin_otsu = imbinarize(prep_gauss);
%      prep_median_bin_otsu = imbinarize(prep_median);
%      prep_wiener_5_bin_otsu = imbinarize(prep_wiener_5);
%      prep_wiener_7_bin_otsu = imbinarize(prep_wiener_7);
%      prep_wiener_9_bin_otsu = imbinarize(prep_wiener_9);
%      prep_wiener_11_bin_otsu = imbinarize(prep_wiener_11);
%      prep_wiener_13_bin_otsu = imbinarize(prep_wiener_13);

     
%       path = 'bin/otsu/';
%       imwrite(bin_otsu, strcat(path, '12.bin_otsu.png'));
%      imwrite(prep_gauss_bin_otsu, strcat(path, 'prep_gauss_bin_otsu.png'));
%      imwrite(prep_median_bin_otsu, strcat(path, 'prep_median_bin_otsu.png'));
%      imwrite(prep_wiener_5_bin_otsu, strcat(path, 'prep_wiener_5_bin_otsu.png'));
%      imwrite(prep_wiener_7_bin_otsu, strcat(path, 'prep_wiener_7_bin_otsu.png'));
%      imwrite(prep_wiener_9_bin_otsu, strcat(path, 'prep_wiener_9_bin_otsu.png'));
%      imwrite(prep_wiener_11_bin_otsu, strcat(path, 'prep_wiener_11_bin_otsu.png'));
%      imwrite(prep_wiener_13_bin_otsu, strcat(path, 'prep_wiener_13_bin_otsu.png'));
%      imwrite(prep_butterworth_bin_otsu, strcat(path, 'prep_butterworth_bin_otsu.png'));
  
%     cprintf('Blue', '    Otsu binarization completed.\n');


     %% ------------------------Niblack-----------------------%%
%        cprintf('Black', '    Niblack binarization started...\n');
%      bin_niblack_3 = niblack(image_gray, 3);
%      bin_niblack_5 = niblack(image_gray, 5);
%      bin_niblack_7 = niblack(image_gray, 7);
%      bin_niblack_9 = niblack(image_gray, 9);
%       bin_niblack_11 = niblack(image_gray, 11);
%      bin_niblack_13 = niblack(image_gray, 13);
%      bin_niblack_15 = niblack(image_gray, 15);
%      bin_niblack_17 = niblack(image_gray, 17);
      
%      path = 'bin/niblack/12/';
%      imwrite(bin_niblack_3, strcat(path, 'bin_niblack_3_-0.5.png'));
%      imwrite(bin_niblack_5, strcat(path, 'bin_niblack_5_-0.5.png'));
%      imwrite(bin_niblack_7, strcat(path, 'bin_niblack_7_-0.5.png'));
%      imwrite(bin_niblack_9, strcat(path, 'bin_niblack_9_.png'));
%      imwrite(bin_niblack_11, strcat(path, 'bin_niblack_11.png'));
%      imwrite(bin_niblack_13, strcat(path, 'bin_niblack_13_-0.5.png'));
%      imwrite(bin_niblack_15, strcat(path, 'bin_niblack_15_-0.5.png'));
%      imwrite(bin_niblack_17, strcat(path, 'bin_niblack_17.png'));
      
%      prep_gauss_bin_niblack_11 = niblack(prep_gauss, 11);
%       prep_median_bin_niblack_11 = niblack(prep_median, 11);
%        prep_median_bin_niblack_17 = niblack(prep_median, 17);
%      prep_wiener_5_bin_niblack_11 = niblack(prep_wiener_5, 11);
%      prep_wiener_7_bin_niblack_11 = niblack(prep_wiener_7, 11);
%      prep_wiener_9_bin_niblack_11 = niblack(prep_wiener_9, 11);
%      prep_wiener_11_bin_niblack_11 = niblack(prep_wiener_11, 11);
%      prep_wiener_13_bin_niblack_11 = niblack(prep_wiener_13, 11);
%        prep_butterworth_5_3_bin_niblack_11 = niblack(prep_butterworth_5_3, 11);
%        prep_butterworth_20_3_bin_niblack_11 = niblack(prep_butterworth_20_3, 11);
%        prep_butterworth_100_3_bin_niblack_11 = niblack(prep_butterworth_100_3, 11);
%        prep_butterworth_200_3_bin_niblack_11 = niblack(prep_butterworth_200_3, 11);
%        prep_butterworth_300_3_bin_niblack_11 = niblack(prep_butterworth_300_3, 11);
%        prep_butterworth_500_3_bin_niblack_11 = niblack(prep_butterworth_500_3, 11);

%        path = 'prep/niblack/1/';
%      imwrite(bin_niblack_11, strcat(path, 'bin-niblack_11.png'));
%      imwrite(prep_gauss_bin_niblack_11, strcat(path, 'prep-gauss_bin-niblack_11.png'));
%      imwrite(prep_butterworth_bin_niblack_11, strcat(path, 'prep-butterworth_bin-niblack_11.png'));
%        imwrite(prep_median_bin_niblack_17, strcat(path, 'prep-median_bin-niblack_17_-0.5.png'));
%        imwrite(prep_wiener_5_bin_niblack_11, strcat(path, 'prep-wiener_5_bin-niblack_11_-0.5.png'));
%       imwrite(prep_wiener_7_bin_niblack_11, strcat(path, 'prep-wiener_7_bin-niblack_11.png'));
%       imwrite(prep_wiener_9_bin_niblack_11, strcat(path, 'prep-wiener_9_bin-niblack_11.png'));
%       imwrite(prep_wiener_11_bin_niblack_11, strcat(path, 'prep-wiener_11_bin-niblack_11.png'));
%       imwrite(prep_wiener_13_bin_niblack_11, strcat(path, 'prep-wiener_13_bin-niblack_11.png'));
% imwrite(prep_butterworth_5_3_bin_niblack_11, strcat(path, 'prep-butterworth_5_3_bin-niblack_11.png'));
% imwrite(prep_butterworth_20_3_bin_niblack_11, strcat(path, 'prep-butterworth_20_3_bin-niblack_11.png'));
% imwrite(prep_butterworth_100_3_bin_niblack_11, strcat(path, 'prep-butterworth_100_3_bin-niblack_11.png'));
% imwrite(prep_butterworth_200_3_bin_niblack_11, strcat(path, 'prep-butterworth_200_3_bin-niblack_11.png'));
% imwrite(prep_butterworth_300_3_bin_niblack_11, strcat(path, 'prep-butterworth_300_3_bin-niblack_11.png'));
% imwrite(prep_butterworth_500_3_bin_niblack_11, strcat(path, 'prep-butterworth_500_3_bin-niblack_11.png'));
  
%    cprintf('Blue', '    Niblack binarization completed.\n');

     %% ------------------------Sauvola-----------------------%%
%         cprintf('Black', '    Sauvola binarization started...\n');
%         
%         
%         path = 'bin/sauvola/12/k0.065/';
%         
%         bin_sauvola_13 = sauvola(image_gray, 13);
%         imwrite(bin_sauvola_13, strcat(path, 'bin_sauvola_13.png'));
%         bin_sauvola_15 = sauvola(image_gray, 15);
%         imwrite(bin_sauvola_15, strcat(path, 'bin_sauvola_15.png'));
%         bin_sauvola_17 = sauvola(image_gray, 17);
%         imwrite(bin_sauvola_17, strcat(path, 'bin_sauvola_17.png'));
%         bin_sauvola_19 = sauvola(image_gray, 19);
%         imwrite(bin_sauvola_19, strcat(path, 'bin_sauvola_19.png'));
%         bin_sauvola_21 = sauvola(image_gray, 21);
%         imwrite(bin_sauvola_21, strcat(path, 'bin_sauvola_21.png'));
%         bin_sauvola_33 = sauvola(image_gray, 33);
%         imwrite(bin_sauvola_33, strcat(path, 'bin_sauvola_33.png'));
%         bin_sauvola_25 = sauvola(image_gray, 25);
%         imwrite(bin_sauvola_25, strcat(path, 'bin_sauvola_25.png'));
%         bin_sauvola_50 = sauvola(image_gray, 50);
%         imwrite(bin_sauvola_50, strcat(path, 'bin_sauvola_50_.png'));
%   
%         cprintf('Blue', '    Sauvola binarization completed.\n');

    %% --------------------------Gatos---------------------------%%
         cprintf('Black', '    Gatos binarization started...\n');
         bin_gatos = gatos(image_gray, 3, 11);
         imwrite(bin_gatos, 'bin/gatos/0.065/11/1.bin_gatos.png');
         cprintf('Blue', '    Gatos binarization completed.\n');
        
 cprintf('Strings', '  Binarization completed.\n');
     
     
     
%% --------------------------Post-Filtering--------------------------- %%
%  cprintf('UnterminatedStrings', '  Post-Binarization Filtering started...\n');

     %% ---------------------Wiener Low Pass Filter--------------------- %%
%      cprintf('Black', '    Wiener Low Pass Filter started...\n');
            %% -------------------Otsu-------------------- %%     
%      bin_otsu = imread('bin/otsu/6.bin-otsu.png');
     
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
%       path = 'bin/niblack/12/';
%      bin_niblack_17 = imread(strcat(path, 'bin_niblack_17.png'));
%       bin_niblack_11 = imread(strcat(path, 'bin_niblack_11.png'));

%      bin_niblack_17_post_wiener_3 = wiener2(bin_niblack_17, [3 3]);
%      bin_niblack_17_post_wiener_5 = wiener2(bin_niblack_17, [5 5]);
%      bin_niblack_17_post_wiener_7 = wiener2(bin_niblack_17, [7 7]);
%      bin_niblack_17_post_wiener_9 = wiener2(bin_niblack_17, [9 9]);
%  path = 'bin/niblack/1/';
%  prep_median_bin_niblack_11 = imread(strcat(path, 'prep-median_bin-niblack_11.png'));
%  prep_median_bin_niblack_11_05 = imread(strcat(path, 'prep-median_bin-niblack_11_-0.5.png'));
%  prep_median_bin_niblack_17 = imread(strcat(path, 'prep-median_bin-niblack_17.png'));
%  prep_median_bin_niblack_17_05 = imread(strcat(path, 'prep-median_bin-niblack_17_-0.5.png'));

%         prep_median_bin_niblack_17_post_wiener_11 = wiener2(prep_median_bin_niblack_17, [11 11]);
%         prep_median_bin_niblack_17_05_post_wiener_11 = wiener2(prep_median_bin_niblack_17_05, [11 11]);

%       bin_niblack_17_post_wiener_13 = wiener2(bin_niblack_17, [13 13]);
%         prep_median_bin_niblack_11_post_wiener_11 = wiener2(prep_median_bin_niblack_11, [11 11]);
%         prep_median_bin_niblack_11_05_post_wiener_11 = wiener2(prep_median_bin_niblack_11_05, [11 11]);
%        bin_niblack_11_post_median = medfilt2(bin_niblack_11);
%      bin_niblack_17_post_wiener_15 = wiener2(bin_niblack_17, [15 15]);
%         prep_median_bin_niblack_17_post_wiener_17 = wiener2(prep_median_bin_niblack_17, [17 17]);
%         prep_median_bin_niblack_17_05_post_wiener_17 = wiener2(prep_median_bin_niblack_17_05, [17 17]);
%         prep_median_bin_niblack_11_post_wiener_17 = wiener2(prep_median_bin_niblack_11, [17 17]);
%         prep_median_bin_niblack_11_05_post_wiener_17 = wiener2(prep_median_bin_niblack_11_05, [17 17]);

%       bin_niblack_17_post_wiener_19 = wiener2(bin_niblack_17, [19 19]);
%       bin_niblack_11_post_wiener_19 = wiener2(bin_niblack_11, [19 19]);

%        bin_niblack_17_post_wiener_21 = wiener2(bin_niblack_17, [21 21]);
%        bin_niblack_11_post_wiener_21 = wiener2(bin_niblack_17, [21 21]);

%      bin_niblack_17_post_wiener_23 = wiener2(bin_niblack_17, [23 23]);
     
%      bin_niblack_11_post_wiener_11_bin_otsu = imbinarize(bin_niblack_11_post_wiener_11);
%      bin_niblack_11_post_wiener_13_bin_otsu = imbinarize(bin_niblack_11_post_wiener_13);
%        prep_median_bin_niblack_11_post_wiener_17_bin_otsu = imbinarize(prep_median_bin_niblack_11_post_wiener_17);
%        prep_median_bin_niblack_11_post_wiener_11_bin_otsu = imbinarize(prep_median_bin_niblack_11_post_wiener_11);
%        prep_median_bin_niblack_17_post_wiener_11_bin_otsu = imbinarize(prep_median_bin_niblack_17_post_wiener_11);
%        prep_median_bin_niblack_17_post_wiener_17_bin_otsu = imbinarize(prep_median_bin_niblack_17_post_wiener_17);
%        
%        prep_median_bin_niblack_11_05_post_wiener_17_bin_otsu = imbinarize(prep_median_bin_niblack_11_post_wiener_17);
%        prep_median_bin_niblack_11_05_post_wiener_11_bin_otsu = imbinarize(prep_median_bin_niblack_11_post_wiener_11);
%        prep_median_bin_niblack_17_05_post_wiener_11_bin_otsu = imbinarize(prep_median_bin_niblack_17_post_wiener_11);
%        prep_median_bin_niblack_17_05_post_wiener_17_bin_otsu = imbinarize(prep_median_bin_niblack_17_post_wiener_17);

%      bin_niblack_11_post_wiener_19_bin_otsu = imbinarize(bin_niblack_11_post_wiener_19);
%      bin_niblack_11_post_wiener_21_bin_otsu = imbinarize(bin_niblack_11_post_wiener_21);

%      bin_niblack_17_post_wiener_11_bin_otsu = imbinarize(bin_niblack_17_post_wiener_11);
%      bin_niblack_17_post_wiener_13_bin_otsu = imbinarize(bin_niblack_17_post_wiener_13);
%      bin_niblack_17_post_wiener_17_bin_otsu = imbinarize(bin_niblack_17_post_wiener_17);
%      bin_niblack_17_post_wiener_19_bin_otsu = imbinarize(bin_niblack_17_post_wiener_19);
%      bin_niblack_17_post_wiener_21_bin_otsu = imbinarize(bin_niblack_17_post_wiener_21);
     
%        path = 'full/12/';
%       imwrite(prep_median_bin_niblack_11_post_wiener_17_bin_otsu, strcat(path, 'prep_median_bin_niblack_11_-0.2_post_wiener_17_bin_otsu.png'));
%       imwrite(prep_median_bin_niblack_11_post_wiener_11_bin_otsu, strcat(path, 'prep_median_bin_niblack_11_-0.2_post_wiener_11_bin_otsu.png'));
%       imwrite(prep_median_bin_niblack_17_post_wiener_11_bin_otsu, strcat(path, 'prep_median_bin_niblack_17_-0.2_post_wiener_11_bin_otsu.png'));
%       imwrite(prep_median_bin_niblack_17_post_wiener_17_bin_otsu, strcat(path, 'prep_median_bin_niblack_17_-0.2_post_wiener_17_bin_otsu.png'));
%       
%       imwrite(prep_median_bin_niblack_11_05_post_wiener_17_bin_otsu, strcat(path, 'prep_median_bin_niblack_11_-0.5_post_wiener_17_bin_otsu.png'));
%       imwrite(prep_median_bin_niblack_11_05_post_wiener_11_bin_otsu, strcat(path, 'prep_median_bin_niblack_11_-0.5_post_wiener_11_bin_otsu.png'));
%       imwrite(prep_median_bin_niblack_17_05_post_wiener_11_bin_otsu, strcat(path, 'prep_median_bin_niblack_17_-0.5_post_wiener_11_bin_otsu.png'));
%       imwrite(prep_median_bin_niblack_17_05_post_wiener_17_bin_otsu, strcat(path, 'prep_median_bin_niblack_17_-0.5_post_wiener_17_bin_otsu.png'));
      %imwrite(bin_niblack_11_post_wiener_21_bin_otsu, strcat(path, 'bin_niblack_11_post_wiener_21_bin_otsu.png'));
     
%       path = 'post/niblack/11/median/12/';
%      imwrite(bin_niblack_17_post_wiener_11_bin_otsu, strcat(path, 'bin_niblack_17_post_wiener_11_bin_otsu.png'));
%       imwrite(bin_niblack_11_post_median, strcat(path, 'bin_niblack_11_post_median.png'));
%      imwrite(bin_niblack_17_post_wiener_17_bin_otsu, strcat(path, 'bin_niblack_17_post_wiener_17_bin_otsu.png'));
%      imwrite(bin_niblack_17_post_wiener_19_bin_otsu, strcat(path, 'bin_niblack_17_post_wiener_19_bin_otsu.png'));
%      imwrite(bin_niblack_17_post_wiener_21_bin_otsu, strcat(path, 'bin_niblack_17_post_wiener_21_bin_otsu.png'));
%      imwrite(bin_niblack_17_post_wiener_3, strcat(path, 'bin_niblack_17_post_wiener_3.png'));
%      imwrite(bin_niblack_17_post_wiener_5, strcat(path, 'bin_niblack_17_post_wiener_5.png'));
%      imwrite(bin_niblack_17_post_wiener_7, strcat(path, 'bin_niblack_17_post_wiener_7.png'));
%      imwrite(bin_niblack_17_post_wiener_9, strcat(path, 'bin_niblack_17_post_wiener_9.png'));
%      imwrite(bin_niblack_17_post_wiener_11, strcat(path, 'bin_niblack_17_post_wiener_11.png'));
%      imwrite(bin_niblack_17_post_wiener_13, strcat(path, 'bin_niblack_17_post_wiener_13.png'));
%      imwrite(bin_niblack_17_post_wiener_15, strcat(path, 'bin_niblack_17_post_wiener_15.png'));
%      imwrite(bin_niblack_17_post_wiener_17, strcat(path, 'bin_niblack_17_post_wiener_17.png'));
%      imwrite(bin_niblack_17_post_wiener_19, strcat(path, 'bin_niblack_17_post_wiener_19.png'));
%      imwrite(bin_niblack_17_post_wiener_21, strcat(path, 'bin_niblack_17_post_wiener_21.png'));
%      imwrite(bin_niblack_17_post_wiener_23, strcat(path, 'bin_niblack_17_post_wiener_23.png'));
     
%      cprintf('Blue', '    Wiener Low Pass Filter completed.\n');

     %% ----------------------Median Low Pass Filter-------------------- %%
%         cprintf('Black', '    Median Low Pass Filter started...\n');
%         bin_otsu_post_median = ~medfilt2(bin_otsu);
%         imwrite(bin_otsu_post_median, 'post/otsu/median/7.bin_otsu_post_median.png');
%         cprintf('Blue', '    Median Low Pass Filter completed.\n');

     %% ----------------------Gaussian Low Pass Filter-------------------- %%
%         cprintf('Black', '    Gaussian Low Pass Filter started...\n');
%         bin_otsu_post_gauss = imgaussfilt(bin_otsu);
%         imwrite(bin_otsu_post_gauss, 'post/otsu/gauss/7.bin_otsu_post_gauss.png');
%         cprintf('Blue', '    Gaussian Low Pass Filter completed.\n');
        
     %% ---------------Low Pass Butterworth Filter-------------- %%
     %image_bin_filter_butterworth = butterworthbpf(image_bin_niblack_5, 100, 1, 8);
        %  bin_niblack_11_post_gauss = 
%   cprintf('Strings', '  Post-Binarization Filtering Completed.\n');


%% ------------------------------Finalize------------------------------ %%
load chirp;
sound(y, 2 * Fs);
notify('DONE!', 'MATLAB R2017a', '', 'Sosumi');

%handel
%gong
%chirp
%sound(y,Fs);


cprintf('Comments', 'Done.\n');

     