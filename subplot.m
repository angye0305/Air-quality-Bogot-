 %Analisis de la visibilidad atmosferica del centro de la ciudad de Bogotá por medio de la intensidad  de imagenes
%Primer sitio: ML1
%Número de posibles imagenes:5
%Los niveles de las imagenes fueron arrglados previamente en ps, ademas del tamaño de las mismas. 
%Se tendra una resolución de 100 pixeles/cm en 1000x~700 pixeles
%La base será la imagen 5
function subplot()

imagen = rgb2gray(imread('5.jpg'));
zone1 = imagen(330:370,600:650);
prom = mean2(zone1);
imagen(330:370,600:650) = 0;
fprintf('El promedio de la imagen base es %d, \n ',prom);
imshow(imagen);
axis('on');
title('Imagen base');
juana=dir([pwd,'\*.JPG']);
numarchivos = length(juana);
arreglo = zeros(1,numarchivos);
arreglo1 = zeros(1,numarchivos);
arreglo2 = zeros(1,numarchivos);
for n=1:numarchivos
      
    text = sprintf('%d.jpg',n);
    foto = rgb2gray(imread(text));
    zone2 = foto(330:370,600:650);
    prom2 = mean2(zone2);
    foto(330:370,600:650) = 0;
    arreglo(n) = prom2;
    figure(n);
    imshow(foto);
    title(text);
    axis('on');
    hold on;
end
   
disp(arreglo);

fprintf('El promedio del resto de las imagenes es %d, \n',arreglo(1));
    
        for n=1:5

        concentracion=(prom-arreglo(n+1))/(prom-arreglo(n));
        arreglo1(n)=concentracion;
        coef=(-(1/13985))*log(concentracion);
        arreglo2(n)=coef;
        promcoef = mean2(arreglo2);
        
        end
    
fprintf('La concentración de c(x2)/c(x1) es %d,\n' ,arreglo1);    
fprintf('El coeficiente de extinción %d \n',arreglo2);
fprintf('El promedio del coeficiente de extinsión es de %d.',promcoef);

end
