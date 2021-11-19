% 载入数据
clear;
clc;
[~, ~, tmp] = xlsread("50etf.xlsx");
tmp(1, :) = [];
tmp(:, [1, 2, 8, 9]) = [];
tmp(end - 1 : end, :) = [];

data = cell2mat(tmp(:, 2 : end));
data = [arrayfun(@(x) str2double(datestr(x, 'yyyymmdd')), datenum(tmp(:, 1))), data];


% 计算标准波动率
len = 30;
for i = len + 1 : size(data, 1)
    
    data(i, 6) = Vol_Simple1(data(i - len : i, 2 : 5), 252);
    data(i, 7) = Vol_Simple2(data(i - len : i, 2 : 5), 252);
    data(i, 8) = Vol_Parkinson(data(i - len + 1: i, 2 : 5), 252);
    data(i, 9) = Vol_Garmen_Klass(data(i - len + 1 : i, 2 : 5), 252);
    data(i, 10) = Vol_Roger_Satchell(data(i - len + 1 : i, 2 : 5), 252);
    data(i, 11) = Vol_Garmen_Klass_Yang_Zhang(data(i - len : i, 2 : 5), 252);
    data(i, 12) = Vol_Yang_Zhang(data(i - len : i, 2 : 5), 252);
end

