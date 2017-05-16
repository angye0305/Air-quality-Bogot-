function paperIR()

fotos = dir('*.jpg');
archivos=dir([pwd,'\*.JPG']);
numarchivos = length(archivos);
Coefs = zeros(numarchivos,1);
Vis = zeros(numarchivos,1);
promb= zeros(numarchivos,1);
promz2= zeros(numarchivos,1);
promz1=zeros(numarchivos,1);

for n=1: numarchivos
    disp(n);
    imagen = rgb2gray(imread(fotos(n).name));
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
    
    promb(n)= prombackground;
    promz1(n)= promzona1;
    promz2(n)=promzona2;

    concentracion= (prombackground-promzona2)/(prombackground-promzona1);
    x1= 0.1; %km
    x2=0.35; %km
    x= x2-x1;
    coef= -(1/x)* log(concentracion);
    fprintf('El coeficiente de extinción será igual a %d,\n ',coef); 
    visibilidad= 3/coef;
    fprintf('La visibilidad tiene un valor de %d',visibilidad);
    figure, imshow(imagen);
    hold on
    grid on
    axis on
    title(fotos(n).name)
    Coefs(n) = coef;
    Vis(n) = visibilidad;
end
    filename = 'datos.xlsx';
    lim1 = sprintf('A2:A%d',numarchivos+1);
    lim2 = sprintf('B2:B%d',numarchivos+1);
    lim3 = sprintf('C2:C%d',numarchivos+1);
    lim4 = sprintf('D2:D%d',numarchivos+1);
    lim5 = sprintf('E2:E%d',numarchivos+1);
   
    xlswrite(filename, {'Coeficiente','Visibilidad','Promedio del Background','Promedio Zona1','Promedio Zona2'},'A1:E1');
    xlswrite(filename,Coefs,1,lim1);
    xlswrite(filename,Vis,1,lim2);
    xlswrite(filename,promb,1,lim3);
    xlswrite(filename,promz1,1,lim4);
    xlswrite(filename,promz2,1,lim5);

end
