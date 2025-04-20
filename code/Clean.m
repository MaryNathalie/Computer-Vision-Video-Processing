function image = Clean(im,rad)
imm = im;
im = imfill(im);
im = ~bwareaopen(~im, 300);
im = imopen(im, strel('disk',100));
while im(:,:) == 0;
    rad = rad+10;
    im = imclose(imm, strel('disk',rad)); 
    im = imfill(im);
    im = ~bwareaopen(~im, 300);
    im = imopen(im, strel('disk',90));
end
image = im;
end




