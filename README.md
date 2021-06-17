# TCC-VWGG
UMA METODOLOGIA PARA RECONSTRUÇÃO 3D DE IMAGENS PULMONARES PARA AUXÍLIO AO DIAGNÓSTICO MÉDICO DE COVID-19

Centro Universitário FEI


Guilherme Henrique Moreira

Gustavo Araújo Queiroz

Victor Antonio Silva de Queiroz

William Gabriel Barbosa


Requisitos:

Lista de requisitos:
  
    Python 3.7
    Pytorch
    skimage
    torchvision
    re
    OpenCV
    Numpy
    Scikit-Learn

Ambiente:

O código do arquivo HOLOMED_CNN_PYTORCH_PREDICTIONS.pynb é baseado em Python 3.7, PyTorch 1.3. O código foi executado em uma placa gráfica NVIDIA GTX 1080Ti.

Base de dados utilizada:

A base de dados utilizada, foi a COVID-CT e está disponível em: https://drive.google.com/drive/folders/1JLc6IT8bou-q20Bcyq0OVCf8wTXo2ePg?usp=sharing

O nome do arquivo é: images-processed-original e deve ser copiado para a pasta "DenseNet Pytorch" localizada neste repositório.

Modelo pré-treinado: 

O modelo utilizado foi a DenseNet169 e está disponível em: https://drive.google.com/file/d/1zS8vZ-qu08oIqk6JNkZDjVvusYhE2GGj/view?usp=sharing

O nome do arquivo é: pretrained_covid_model.pkl e deve ser copiado para a pasta "DenseNet Pytorch" localizada neste repositório.

Visualização das predições:

Para conseguir visualizar as predições feitas pela rede neural, é necessário realizar o download do arquivo modelo_original_pth.pth  e deve ser copiado para a pasta "DenseNet Pytorch" localizada neste repositório.

O modelo utilizado está disponível em: https://drive.google.com/file/d/1PQZ2WmVSao1t0dQRdCQAybQl9fPjvNt7/view?usp=sharing

Performance obtida:

Acurácia: 88.2%

Área sob a curva ROC: 96.1%
