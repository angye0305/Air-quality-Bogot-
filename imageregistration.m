
function imageregistration()

base=rgb2gray(imread('25.jpg'));
juana=dir([pwd,'\*.JPG']);
numarchivos = length(juana);

for n=1:numarchivos;
    
    text = sprintf('%d.jpg',n);
    image = rgb2gray(imread(text));
    [optimizer, metric] = imregconfig('monomodal');
    tform=imregtform(image,base,'affine', optimizer, metric);
    mov = imwarp(image,tform,'OutputView',imref2d(size(base)));
    %imshow(movingRegistered);
    %imshow (base);
    %imshow (image);
    imshowpair(mov,base,'montage');
    hold on;
    
end

