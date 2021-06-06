% Função de pre-processamento da base toda

function writen

%Faz CT_COVID 329
%faz tomo ori 301
for i=1:329
    
    % Caminho das imagens orignais
    concatenateRead = strcat('X:\facul\TCC\imgens cnn\CT_COVID\1 (',num2str(i),').png');
    
    % Leitura da imagem
    img = imread(concatenateRead);
    
    % Ruido
    %img1 = imgNoise(img,0.1); 
    
    
    % Limiar
    img2 = histoeq3(img); 


    % Caminho aonde as imagens vao ser salvas
    concatenateWrite = strcat('X:\facul\TCC\imgens cnn\CT_COVID CorteMasc\1 (', num2str(i),').png');
    
    % Salva as imagens
    imwrite(img2,concatenateWrite);
    
end

%Faz CT_NonCovid 387
for i=1:387
   
    % Caminho das imagens orignais
    concatenateRead = strcat('X:\facul\TCC\imgens cnn\CT_NonCOVID\1 (', num2str(i), ').png');
    
    % Leitura da imagem
    img = imread(concatenateRead);
    
    % Ruido
    %img1 = imgNoise(img,0.1); 
    
    % Limiar
    img2 = histoeq3(img); 

    % Caminho aonde as imagens vao ser salvas
    concatenateWrite = strcat('X:\facul\TCC\imgens cnn\CT_NonCOVID CorteMasc\1 (', num2str(i),').png');
    
    % Salva as imagens
    imwrite(img2,concatenateWrite);
    
end

end