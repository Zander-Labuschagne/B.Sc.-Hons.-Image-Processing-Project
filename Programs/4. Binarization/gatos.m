function bin_gatos = gatos(Is, wiener_kernel_size, local_window_size)
%Binarize image by using Gatos algorithm
%   Is = Source grayscale image
%   I = Grayscale source image Is applied with Wiener low pass filter
%   S = Grayscale Winer filtered image I binarized with Sauvola algorithm
%   B = Grayscale background image interpolated

    %Gatos pre-processing - supose to be Wiener low pass
    cprintf('UnterminatedStrings', '      Gatos pre-processing started...\n');
    %pre = wierner(image, 3);
    I = wiener2(Is, [wiener_kernel_size wiener_kernel_size]);
    cprintf('Green', '      Gatos preprocessing finished.\n');

    cprintf('UnterminatedStrings', '      Sauvola binarization for Gatos binarization started...\n');
    bin_gatos = sauvola(pre, local_window_size);
    cprintf('Green', '      Sauvola binarization for Gatos binarization finished.\n');

    cprintf('UnterminatedStrings', '      Background surface estimation started...\n');
    B = bSurfEst(S, Is);
    
    cprintf('Green', '      Background surface estimation finished.\n');
    
end

