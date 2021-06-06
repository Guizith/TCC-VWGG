function salvanii

for i = 1:200
    
    
    concatenateRead = strcat('X:\facul\TCC\imgens cnn\TomoJunta - Copia\1 (',num2str(i),').png');
    
    img(:,:,i) = imread(concatenateRead);
    
    
    nii = nii_tool('init', img);
    nii_tool('save', nii, 'my_nii.nii');
    
    
end