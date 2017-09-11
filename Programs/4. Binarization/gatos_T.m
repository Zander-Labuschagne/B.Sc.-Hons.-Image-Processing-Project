function T = gatos_T(B, I, S)
%Gatos final thresholding
%   B = Grayscale background image
%   I = Grayscale source image Is applied with Wiener low pass filter
%   S = Grayscale Winer filtered image I binarized with Sauvola algorithm
%   T = Binarized image

    T = zeros(size(B, 1), size(B, 2));
    pause(3);
    for x = 1 : size(B, 1)
        fprintf('        Gatos Final Thresholding Progress: %d%%\n', fix(x / size(B, 1) * 100));
        for y = 1 : size(B, 2)
            if B(x, y) - I(x, y) > get_d(uint8(B), I, S)
                T(x, y) = 0;
            else
                T(x, y) = 255;
            end;
        end;
    end;
end

