function draw_lines(image)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% 
%     for i = 1 : size(image, 1)
%         for ii = 1 : size(image, 2)
%             sum = sum + image_bin(i, ii);
%         end;
%         horizontal_sum(i) = sum;
%         horizontal_avg(i) = sum / size(image, 2);
%         sum = 0;
%     end;

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
        if (vertical_sum(v) < avg)
            index = v;
            v = size(vertical_sum(2));
        end;
    end;

    index

    figure('Name', 'Vertical Sum', 'NumberTitle', 'off');
    plot(vertical_sum);
    figure('Name', 'Vertical Average', 'NumberTitle', 'off');
    plot(vertical_avg);

    % figure('Name', 'Horizontal Sum', 'NumberTitle', 'off');
    % plot(horizontal_sum);
    % figure('Name', 'Horizontal Average', 'NumberTitle', 'off');
    % plot(horizontal_avg);

end