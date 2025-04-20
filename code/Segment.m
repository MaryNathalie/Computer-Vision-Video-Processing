function im = Segment(file,bin)
ref = imread('C:\Users\Mary\Desktop\Year5_Sem1\186\Act11\FRAMES\vid2 (10-12-2019 11-26-34 AM)\vid2 130.jpg');
ref = double(ref);

roi1 = imcrop(ref, [1200 700 105 90]); roi = roi1;
roiR = roi(:,:,1); roiG = roi(:,:,2); roiB = roi(:,:,3); 
roiI = roiR + roiG + roiB; roiI(roiI==0) = 100000;
roir = roiR./roiI; roig = roiG./roiI;

im = double(file);
imR = im(:,:,1); imG = im(:,:,2); imB = im(:,:,3);
imI = imR + imG + imB;
imI(imI==0) = 100000;
imr = imR./imI; img = imG./imI; imb = imB./imI;

intr = round(roir*(bin-1)+1); intg = round(roig*(bin-1)+1);
color = intg(:) + (intr(:)-1)*bin;
hist = zeros(bin,bin);
for row = 1:bin
    for column = 1:(bin-row+1)
        hist(row,column) = length(find(color ==(((column+(row-1)*bin)))));
    end
end
imsize = size(imr); npsroi  = zeros(imsize(1),imsize(2));
for i = 1:imsize(1)
    for j = 1:imsize(2)
        rnew = round(imr(i,j)*(bin-1)+1);
        gnew = round(img(i,j)*(bin-1)+1);
        npsroi(i,j) = hist(rnew,gnew);
    end
end
im = npsroi; im(1:330,:)=0; im(986:1080,:)=0;
end