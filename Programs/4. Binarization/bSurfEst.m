function B = bSurfEst(S, I, dx, dy)
%Background surface estimation algorithm from binary image to grayscale by
%interpolation
%   S = Grayscale Winer filtered image I binarized with Sauvola algorithm
%   B = Grayscale background image interpolated
%   sx * sy = Should be great enough to cover at least two image characters
        %sx = [150, 200]
        %sy = [100, 150]
    
    B = uint8(zeros(size(S, 1), size(S, 2)));
    
    for x = 1 : size(S, 1)
        fprintf('        Background Surface Estimation Progress: %d%%\n', fix(x / size(S, 1) * 100));
        for y = 1 : size(S, 2)
            %S(x, y)
            if S(x, y) == 255
                B(x, y) = I(x, y);
            else
                numerator = 0;
                denominator = 0;
                for ix = x - dx : x + dx
                    if(ix < 1)
                        ix = x - ix;
                    elseif(ix > size(S, 1))
                        ix = x - dx;
                    end;
                    for iy = y - dy : y + dy
                        if(iy < 1)
                           iy = y - iy;
                        elseif(iy > size(S, 2))
                           iy = y - dy;
                        end;
%                         if(y == 2411)
%                             ix
%                             iy
%                         end;
                        numerator = numerator + double(I(ix, iy)) * (1 - double(S(ix, iy)));
                        denominator = denominator + (1 - S(ix, iy));

                    end;
                end;
%                 for ix = x - dx : x + dx
%                     if(ix < 1)
%                         ix = x - ix;
%                     elseif(ix > size(S, 1))
%                         ix = x - dx;
%                     end;
%                     for iy = y - dy : y + dy
%                         if(iy < 1)
%                            iy = y - iy;
%                         elseif(iy > size(S, 2))
%                            iy = y - dy;
%                         end;
%                     end;
%                 end;
                %numerator
                %denominator
                B(x, y) = uint8(fix(numerator / denominator));
            end;
        end;
    end;

end

