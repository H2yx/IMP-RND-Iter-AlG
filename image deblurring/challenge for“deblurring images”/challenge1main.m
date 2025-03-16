m=256;n=256;noise=0.000001;
[B, Ac, Ar, X] = challenge1(m, n, noise);
imagesc(X), axis image, colormap gray
xnaive=inv(Ac)*B*inv(Ar');
imagesc(xnaive), axis image, colormap gray