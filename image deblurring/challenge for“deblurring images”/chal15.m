outoffocus1=imread('outoffocus1.tif');
alpha=0.005;
psmall=psfDefocus(40);
P=padPSF(psmall,size(outoffocus1));
[U,S,V]=svd(P);%PÌ«Ð¡ÁË