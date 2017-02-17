%Primer intento. 
%Analisis de la visibilidad atmosferica del centro de la ciudad de Bogotá por medio de la intensidad  de imagenes
%Primer sitio: ML1
%Número de posibles imagenes:7
%Los niveles de las imagenes fueron arrglados previamente en ps, ademas del tamaño de las mismas. 
%Se tendra una resolución de 100 pixeles/cm en 1000x~700 pixeles
%La base será la imagen 7
function [matriz,media] = angye()
base = imread ('7.jpg');
matriz = rgb2gray(base);
media = mean2(matriz);
end