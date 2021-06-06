% Função de testes


function TestScript01

%for i=1:301
    
    % Caminho das imagens orignais
    concatenateRead = strcat('X:\facul\TCC\imgens cnn\01 - Codigos\1 (',num2str(1),').png');
    

    im0 = imread(concatenateRead);
    img2 = Corte3D (im0);


    % Caminho aonde as imagens vao ser salvas
    concatenateWrite = strcat('X:\facul\TCC\imgens cnn\TomoJuntaCorte\1 (', num2str(i),').png');
    
    % Salva as imagens
    %imwrite(img2,concatenateWrite);
    
%end

end 