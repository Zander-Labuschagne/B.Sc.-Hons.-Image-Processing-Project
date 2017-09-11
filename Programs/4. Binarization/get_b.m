function b = get_b(B, S)
%Required by Gatos final binarization if images does not have uniform
%illumination
%   B = Estimated background image
%   S = Grayscale Wiener filtered image I binarized with Sauvola algorithm

    numerator = 0;
    denominator = 0;
    
    for x = 1 : size(S, 1)
        for y = 1 : size(S, 2)
            numerator = numerator + (B(x, y) * (1 - S(x, y)));
            denominator = denominator + (1 - S(x, y));
        end;
    end;
    
    b = numerator / denominator;


end

