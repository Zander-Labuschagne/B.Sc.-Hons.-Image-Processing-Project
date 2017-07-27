function index = draw_vert(image)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% 
    sum = 0;
    for iii = 1 : size(image, 2)
        for iv = 1 : size(image, 1)
            sum = sum + image(iv, iii);
        end;
        vertical_sum(iii) = sum;
        vertical_avg(iii) = sum / size(image, 1);
        sum = 0;
    end;

%Draw Left Vertical Line
%Find index to draw
    index = 0;

    sum = 0;
    for vi = 1 : size(vertical_sum(1))
        sum = sum + vertical_sum(vi);
    end;
    avg = sum ./ size(vertical_sum(1));
    disp('Vertical Average: ');
    avg

    tempAVG = 0;
    tempSUM = 0;

    for v = 1 : (size(vertical_sum, 2) / 4)
        tempSUM = tempSUM + vertical_sum(v);
        tempAVG = tempSUM / v;
        vertical_sum(v)
        if (vertical_sum(v) < avg)
            index = v;
            break;
        end;
    end;

    index

    figure('Name', 'Vertical Sum', 'NumberTitle', 'off');
    plot(vertical_sum);
    figure('Name', 'Vertical Average', 'NumberTitle', 'off');
    plot(vertical_avg);

end