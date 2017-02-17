function paper()

imagen = rgb2gray(imread('5.jpg'));
background = imagen(300:350,600:680);
prombackground = mean2(background);
zona1 = imagen(550:580,200:250);
promzona1 = mean2(zona1);
zona2 = imagen(350:400,140:220);
promzona2 = mean2(zona2);
imagen(300:350,600:680) = 0;
imagen(550:580,200:250)=0;
imagen(350:400,140:220) = 0;

fprintf('El promedio del background es %d, \n ',prombackground);
fprintf('El promedio de la zona 1 es %d, \n ',promzona1);
fprintf('El promedio de la zona 2 es %d, \n ',promzona2);

concentracion= (prombackground-promzona2)/(prombackground-promzona1);
x1= 0.1; %km
x2=0.35; %km
x= x2-x1;
coef= -(1/x)* log(concentracion);
fprintf('El coeficiente de extinción será igual a %d,\n ',coef); 
visibilidad= 3/coef;
fprintf('La visibilidad tiene un valor de %d',visibilidad);
imshow(imagen);