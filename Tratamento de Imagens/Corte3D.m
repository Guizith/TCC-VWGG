%  'X:\facul\TCC\imgens cnn\CT_NonCOVID\1 (50).png'

function [res] = Corte3D(path)

close all
[~,~,chan] = size(path);
    if chan == 3
       im0 = rgb2gray(path);
    else 
        im0 = path;
    end    
    
% Equaliza o histograma
% histeq(im0,590);

[lin,col] = size(im0);

% calcula o histograma
histograma = psrGrayHistogram(im0);

% configura o firefly

% numero de limiares
thresholds = 1;
% numero de fireflies
NFireflies = 50;
% numero de iteracoes
iter = 100;
%metodo da funcao de avaliacao
METHOD = 'TE';
% executa o firefly
bests_limiares = gmpFireflyThresholds(histograma,thresholds,NFireflies,iter,METHOD);
% multi-limiariza a imagem
im1 = psrMultiLimiarizacao(im0,bests_limiares,1);

im2 = zeros(lin,col);
 for y=1:lin
     for x=1:col
         im1(y,x) = 255 - im1(y,x);
         im2(y,x) = 255 - im1(y,x);
     end
 end
 
im3 = logical(im2);
L = bwlabel(im3,8);
 
[r,c]=find(L == 1);

im4 = zeros(lin,col);
N = length(r);
for i=1:N
    im4(r(i),c(i)) = 255;
end 

im4 = bwmorph(im3,'erode');
im4 = bwmorph(im4,'erode');
im4 = bwmorph(im4,'erode');
im4 = bwmorph(im4,'erode');

% Mascara direto no firefly
% for y=1:lin
%     for x=1:col
%         if(im1(y,x) > 0)
%             im5(y,x) = im0(y,x);
%         else
%             im5(y,x) = 0;
%         end
%     end
% end





XC = col/2;
YC = lin/2;
R = lin/2;
for y=1:lin
 for x=1:col
    if sqrt((x-XC)^2 + (y-YC)^2) >= R
       im1(y,x) = 0;
    end
 end
end

im1 = bwmorph(im1,'dilate');
im1 = bwmorph(im1,'dilate');
im1 = bwmorph(im1,'dilate');
im4 = bwmorph(im4,'dilate');
im4 = bwmorph(im4,'dilate');
im4 = bwmorph(im4,'dilate');
 im4 = bwmorph(im4,'dilate');
% im4 = bwmorph(im4,'dilate');
% im4 = bwmorph(im4,'dilate');
% im4 = bwmorph(im4,'dilate');
for y=1:lin
    for x=1:col
        if im4(y,x)
            im4(y,x) = 0;
        else
            im4(y,x) = 1;
        end
    end
end

% for y=1:lin
%     for x=1:col
%         if x < 200
%             im4(y,x) = 0;
%         end
%     end
% end
% 
% for y=1:lin
%     for x=1:col
%         if x > 450
%             im4(y,x) = 0;
%         end
%     end
% end
% 
% for y=1:lin
%     for x=1:col
%         if y > 420
%             im4(y,x) = 0;
%         end
%     end
% end
% 
% for y=1:lin
%     for x=1:col
%         if y < 100
%             im4(y,x) = 0;
%         end
%     end
% end



% Mascara apos morfologia ------------------------------------------
for y=1:lin
    for x=1:col
        if im4(y,x)
            im6(y,x) = im0(y,x);            
        end
    end
end




%mostra as imagens
 figure, imshow(im0);
 figure, imshow(im2);
 figure, imshow(im4);
 %figure, imshow(im7);
 figure, imshow(im6);
 
res = im6;

end


function  im7 = getMainRegions(im1)

% primeira regiao
%%%%%%%%%%%%%%%%%
s  = regionprops(im1, 'Area','PixelList');
Np = length(s);
MaxA = -inf;
for i=1:Np
  A = s(i).Area;
  if A > MaxA
     MaxA = A;
     indx = i;
  end
end

[lin,col] = size(im1);
Tp = size(s(indx).PixelList,1);
im7 = zeros(lin,col);
for i=1:Tp
  xn = s(indx).PixelList(i,1);  
  yn = s(indx).PixelList(i,2);  
  im1(yn,xn) = 0;  
  im7(yn,xn) = 1;
end


% segunda regiao
%%%%%%%%%%%%%%%%%
s  = regionprops(im1, 'Area','PixelList');
Np = length(s);
MaxA = -inf;
for i=1:Np
  A = s(i).Area;
  if A > MaxA
     MaxA = A;
     indx = i;
  end
end

[lin,col] = size(im1);



if indx > length(s)
    
    
else
    Tp = size(s(indx).PixelList,1);
    for i=1:Tp
      xn = s(indx).PixelList(i,1);  
      yn = s(indx).PixelList(i,2);  
      im1(yn,xn) = 0;  
      im7(yn,xn) = 1;
    end 
end




end













