function T = gatos_T(B, I)
%Gatos final thresholding
%   B = Grayscale background image
%   I = Grayscale source image Is applied with Wiener low pass filter
%   T = Binarized image

    for x = 1 : size(B, 1)
        for y = 1 : size(B, 2)
            if B(x, y) - I(x, y) > d(B(x, y))
                T(x, y) = 255;
            else
                T(x, y) = 0;
            end;
        end;
    end;
end

