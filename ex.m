%Analisis de la visibilidad atmosferica del centro de la ciudad de Bogotá por medio de la intensidad  de imagenes
%Primer sitio: ML1
%Número de posibles imagenes:6
%Los niveles de las imagenes fueron arrglados previamente en ps, ademas del tamaño de las mismas. 
%Se tendra una resolución de 100 pixeles/cm en 1000x~700 pixeles
%La base será la imagen 7
function arreglo = ex()
%A continnuanción se encuentra los valores promediados de la intensidad de
%la luz de la imagen base

base = rgb2gray(imread('7.jpg'));
mean_base = mean2(base);
arreglo = zeros(1,6);
for n=1:6
%Encontrando el promedio de el resto de las imagenes    
    text = sprintf('%d.jpg',n);
    foto = imread(text);
    foto_gray = rgb2gray(foto);
    foto_mean = mean2(foto_gray);
%comparando el promedio de cada imagen con el promedio de la imagen base
    mean_dif = mean_base - foto_mean;
    arreglo(n) = mean_dif;
end
end