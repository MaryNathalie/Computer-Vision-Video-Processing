clear all
close all
clc

%% CONSTANTS

gthe = 9.81;
lengm = 0.35; %m
conv = (716-426)/0.01; %pix/m
lengp = lengm*conv; %pix

%% VIDEO 1

fr1 = 1/24.91; %frame rate
x1 = matfile('centx1.mat'); X1 = x1.centx1;
y1 = matfile('centy1.mat'); Y1 = y1.centy1;
X1 = X1(38:end); Y1 = Y1(38:end);
t1 = 0:1:numel(X1)-1; T1 = t1.*fr1;
figure(); plot(T1,X1);
[pks1, loc1] = findpeaks(X1);
time1 = loc1.*fr1;
period1 = diff(time1);
mean1 = mean(period1);
std1 = std(period1);

gexp2 = 4*(pi^2)*lengm/(mean2^2);
disp(gexp2);
error1 = abs(gthe-gexp1)*100/gthe1;
disp(error1);

