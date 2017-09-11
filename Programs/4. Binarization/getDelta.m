function delta = getDelta(B, I, S)
%Required to compute Gatos final binarziation
%   B = Estimated background image
%   I = Grayscale source image Is applied with Wiener low pass filter
%   S = Grayscale Wiener filtered image I binarized with Sauvola algorithm

    numerator = 0;
    denominator = 0;
    for x = 1 : size(I, 1)
        for y = 1 : size(I, 2)
            numerator = numerator + (B(x, y) - I(x, y));
            denominator = denominator + S(x, y);
        end;
    end;

    delta = numerator / denominator;
end

