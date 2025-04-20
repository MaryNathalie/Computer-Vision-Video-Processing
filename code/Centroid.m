function cent = Centroid(ii, file)
dest = 'C:\Users\Mary\Desktop\Year5_Sem1\186\Act11\BLOB\vid1';
bin = 500; rad = 0;
im = Segment(file, bin);
im =  Clean(im, rad);
stat = regionprops(im, 'Centroid');
cent = [stat.Centroid];
while numel(cent) ~= 2
    bin = bin+100;
    im = Segment(file,bin);
    im = Clean(im,rad);
    stat = regionprops(im, 'Centroid');
    cent = [stat.Centroid];
    disp(bin)
end
filedest = fullfile(dest, sprintf('%d.jpg',ii));
imwrite(im, filedest);
end



