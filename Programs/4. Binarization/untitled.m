A = zeros(36, 8);
for(i = 1 : 36)
    ietsie = '';
    for(ii = 1 : 8)
        str = sprintf('%.2f', A(i, ii));
        ietsie = strcat(ietsie, str);
        ietsie = strcat(ietsie, ',');
    end;
    ietsie = strcat(ietsie, '\n');
    system(strcat(ietsie, ' > file.csv'));
end;