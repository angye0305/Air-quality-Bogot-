%Primer intento. 
%Analisis de la visibilidad atmosferica del centro de la ciudad de Bogot� por medio de la intensidad  de imagenes
%Primer sitio: ML1
%N�mero de posibles imagenes:7
%Los niveles de las imagenes fueron arrglados previamente en ps, ademas del tama�o de las mismas. 
%Se tendra una resoluci�n de 100 pixeles/cm en 1000x~700 pixeles
%La base ser� la imagen 7
function [matriz,media] = angye()
base = imread ('7.jpg');
matriz = rgb2gray(base);
media = mean2(matriz);
end