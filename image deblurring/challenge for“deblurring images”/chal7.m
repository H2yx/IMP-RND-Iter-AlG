p1=ones(3)*(1/9);
p2=[1,2,1;2,4,2;1,2,1]*(1/16);
pump=imread('pumpkins.tif');
pump1=imread('pumpkinsnoisy1.tif');
pump2=imread('pumpkinsnoisy2.tif');
%imshow(pump1,[])
%imshow(pump2,[])
smoothpump1=conv2(pump1,p1,'same');
smoothpump2=conv2(pump2,p1,'same');
smooth2pump2=conv2(pump2,p2,'same');
imshow(smoothpump1,[])
imshow(smoothpump2,[])
imshow(smooth2pump2,[])

%p3=[0,-1,0;-1,4,-1;0,-1,0];
%edgepump1=conv2(pump,p3);
%imshow(edgepump1,[])