% funcao de adicao de ruidos
function  [res] = imgNoise (path,ruido)

    im1 = path;

    [~,~,chan] = size(im1);
    if chan == 3
       im2 = rgb2gray(im1);
    else 
        im2 = im1;
    end
    
    im3 = imnoise(im2,'gaussian',ruido);
    res = im3;
  
end