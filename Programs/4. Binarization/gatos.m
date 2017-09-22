function T = gatos(Is, wiener_kernel_size, local_window_size)
%Binarize image by using Gatos algorithm
%   Is = Source grayscale image
%   I = Grayscale source image Is applied with Wiener low pass filter
%   S = Grayscale Wiener filtered image I binarized with Sauvola algorithm
%   B = Grayscale background image interpolated
%   T = Binarized image

    %Gatos pre-processing - supose to be Wiener low pass
    cprintf('UnterminatedStrings', '      Gatos pre-processing started...\n');
    %pre = wierner(image, 3);
    I = wiener2(Is, [wiener_kernel_size wiener_kernel_size]);
    cprintf('Green', '      Gatos preprocessing finished.\n');

    cprintf('UnterminatedStrings', '      Sauvola binarization for Gatos binarization started...\n');
    S = sauvola(I, local_window_size);
    cprintf('Green', '      Sauvola binarization for Gatos binarization finished.\n');

    cprintf('UnterminatedStrings', '      Background surface estimation started...\n');
    B = bSurfEst(S, I, 60, 60);%dx = 150, dy = 150, see bSurfEst.m
    %imwrite(uint8(B), 'bin/gatos/0.065/backgrounds/2.bin_gatos.png');
    cprintf('Green', '      Background surface estimation finished.\n');
    
    
    cprintf('UnterminatedStrings', '      Gatos final thresholding started...\n');
    T = gatos_T(uint8(B), I, S);
    cprintf('Green', '      Gatos final thresholding finished.\n');
    
    cprintf('UnterminatedStrings', '      Gatos post-processing upsampling started...\n');
    T = imresize(T, 2);
    cprintf('Green', '      Gatos post-processing upsampling finished.\n');
   
    
end

