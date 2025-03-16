 P = imread('pumpkins.tif');
 Pd=double(P);
 %imshow(Pd,[])
 inverse=256-Pd;
 %imshow(inverse,[])
 high=sign(P-128);
 %imshow(high,[])
 Pdrough=zeros(256,256);
 for i =1:254
     for j= 1:254
         
         