img = imread('image.jpg');
imwrite(img, 'image.tiff');%jpgתtif

dragon=rgb2gray(dragon); %��ת��

 G=fspecial('average',5);
 
 image=conv2(dragon,G,'same');
 
 subplot(2,2,1)
 imshow(dragon,[])
 box off
 image=conv2(dragon,G,'same');
 subplot(2,2,2)
 imshow(image,[])
 box off
 image2=conv2(image,G,'same');
 subplot(2,2,3)
 imshow(image2,[])
 box off
 image3=conv2(image2,G,'same');
 subplot(2,2,4)
 imshow(image3,[])
 box off
 edge=[0,-1,0;-1,4,-1;0,-1,0];
 

