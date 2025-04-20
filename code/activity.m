close all
clear all
clc

for i = 38:1:371
    disp(i);
    if i<100
        file = imread(sprintf('vid1 %03d.jpg',i));
        c = Centroid(i,file);
        centx(i) = c(1); centy(i) = c(2);
    else
        file = imread(sprintf('vid1 %3d.jpg',i));
        c = Centroid(i,file);
        centx(i) = c(1); centy(i) = c(2);
    end
end

save('centx1.mat','centx');
save('centy1.mat','centy');



