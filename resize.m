
juana=dir([pwd,'\*.JPG']);
numarchivos = length(juana);
arreglo = zeros(1,numarchivos);
Ls = zeros(1,numarchivos);
Hs = zeros(1,numarchivos);

for n=1:numarchivos
    text = sprintf('%d.jpg',n);
    foto_actual = imread(text);
    SZ = size(foto_actual);
    L = SZ(1);
    H = SZ(2);
    Ls(n) = L;
    Hs(n) = H;
end

standL = min(Ls); %Numero de filas
standH = min(Hs);%Numero de columnas

mkdir('Cortes'); %Carpeta donde quedarán.
%Crear nuevas fotos
for n=1:numarchivos
    text = sprintf('%d.jpg',n);
    foto = imread(text);
    zona = foto(1:Ls,1:Hs);
    name = sprintf('Cortes/%d.jpg',n);
    imwrite(zona,name);
end