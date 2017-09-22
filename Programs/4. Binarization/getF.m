function F = getF(m, I)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    F = zeros(size(I, 1) * m, size(I, 2) * m);

    a = x / m;
    
    for i = 1 : i < size(F, 1)
        for ii = 1 : ii < size(F, 1)
            if floor(ii / m) != 0
                F(i, ii) = - a * (1 - a).^2 * I(i, floor(ii / m)) + (1 - 2 * a.^2 + a.^3) * I()
            else
                F(i, ii) = - a * (1 - a).^2 * I(i, 1)
        end;
    end;

end

