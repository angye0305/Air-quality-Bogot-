%Analisis de la visibilidad atmosferica del centro de la ciudad de Bogotá por medio de la intensidad  de imagenes
%Primer sitio: ML1
%Número de posibles imagenes:6
%Los niveles de las imagenes fueron arrglados previamente en ps, ademas del tamaño de las mismas. 
%Se tendra una resolución de 100 pixeles/cm en 1000x~700 pixeles
%La base será la imagen 7
function highlight()

imagen = rgb2gray(imread('7.jpg'));
zone1 = imagen(360:380,620:640);
prom = mean2(zone1);
imagen(360:380,620:640) = 0;
fprintf('El promedio de la imagen base es %d, \n ',prom);
imshow(imagen);
arreglo = zeros(1,6);
arreglo1 = zeros(1,6);
arreglo2 = zeros(1,6);
    for n=1:6
      
        text = sprintf('%d.jpg',n);
        foto = rgb2gray(imread(text));
        zone2 = foto(360:380,620:640);
        prom2 = mean2(zone2);
        foto(360:380,620:640) = 0;
        arreglo(n) = prom2;
        imshow(foto);
       
    end
    
fprintf('El promedio del resto de las imagenes es %d, \n',prom2);
    
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
