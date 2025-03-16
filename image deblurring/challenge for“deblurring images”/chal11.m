pump1=imread('pumpkins.tif');
p1=ones(3)*(1/9);
p3=[0,-1,0;-1,4,-1;0,-1,0];
pump2=conv2(pump1,p1,'same');
pump3=conv2(pump1,p3,'same');
dft1=fft2(pump1);
dft2=fft2(pump2);
dft3=fft2(pump3);
for i=1:512
    for j=1:512
        coeff1(i,j)=norm(dft1(i,j),2);
        coeff2(i,j)=norm(dft2(i,j),2);
        coeff3(i,j)=norm(dft3(i,j),2);
    end
end
logcoeff1=log10(coeff1);
logcoeff2=log10(coeff2);
logcoeff3=log10(coeff3);
subplot(2,2,1)
imagesc(logcoeff1)
colorbar
subplot(2,2,2)
imagesc(logcoeff2)
colorbar
subplot(2,2,3)
imagesc(logcoeff3)
colorbar