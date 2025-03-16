outoffocus1=imread('outoffocus1.tif');
alpha=0.005;
psmall=psfDefocus(40);
P=padPSF(psmall,size(outoffocus1));
center=[20,20]; %center要取psmall的中心？
e1=zeros(size(P));e1(1,1)=1;
S=dct2(dctshift(P,center)./dct2(e1));
phi_tikh=abs(S).^2./(abs(S).^2+alpha^2);
idx=(S~=0);
filt_tikh=zeros(size(phi_tikh));
filt_tikh(idx)=phi_tikh(idx)./S(idx);
X_tikh=idct2(dct2(outoffocus1).*filt_tikh);
imshow(X_tikh,[0,255])