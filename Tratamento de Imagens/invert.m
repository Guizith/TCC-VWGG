

function invert (pathh)

path = imread(pathh);
size(path)

[~,~,chan] = size(path);
    if chan == 3
       im0 = rgb2gray(path);
    else 
        im0 = path;
    end

[lin,col] = size(im0);

im2 = zeros(lin,col);

 for y=1:lin
     for x=1:col
         im2(y,x) = im0(y,x);
     end
 end


 figure, imshow(im0);
 figure, imshow(im2);
