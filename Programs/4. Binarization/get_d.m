function d = get_d(B, I, S)
%Compute d for Gatos final binarization
%   B = Estimated background image
%   I = Grayscale source image Is applied with Wiener low pass filter
%   S = Grayscale Wiener filtered image I binarized with Sauvola algorithm

    q = 0.8; %as suggested by Gatos

    d = q * getDelta(uint8(B), I, S);%First try
    
    %If above does not work we try the below
%     cprintf('UnterminatedStrings', '        Computing b for Gatos final thresholding started...\n');
%     b = get_b(uint8(B), S);
%     cprintf('Green', '        Computation of b for Gatos final thresholding finished.\n');
%     
%     %p1, p2 = [0, 1]
%     q = 0.6 %as suggested by Gatos
%     p1 = 0.5 %as suggested by Gatos
%     p2 = 0.8 %as suggestd by Gatos
%     d = q * delta * ((1 - p2) / (1 + exp((-4 * B(x, y)) / (b * (1 - p1)) + (2 * (1 + p1)) / (1 - p1))) + p2);
end

