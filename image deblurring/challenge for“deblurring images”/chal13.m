tol=2e-3; alpha=0.002;
[Uc,Sc,Vc]=svd(Ac);
[Ur,Sr,Vr]=svd(Ar);
S=diag(Sc)*diag(Sr)';
phi_tsvd=(abs(S)>=tol);
phi_tikh=abs(S).^2./(abs(S).^2+alpha^2);
filt_tsvd=phi_tsvd./S;
filt_tikh=phi_tikh./S;
X_tsvd=Vc*((Uc'*B*Ur).*filt_tsvd)*Vr';
X_tikh=Vc*((Uc'*B*Ur).*filt_tikh)*Vr';
subplot(2,2,1)
imshow(B,[])
title('blurred image')

k1=46;
k2=60;
[c1,c2,c3]=svd(Ac);
[r1,r2,r3]=svd(Ar);
Ac_k1=c3(:,1:k1)*inv(c2(1:k1,1:k1))*c1(:,1:k1)';
Ar_k2=r3(:,1:k2)*inv(r2(1:k2,1:k2))*r1(:,1:k2)';
Xnaive=inv(Ac)*B*inv(Ar');
%imshow(Xnaive,[])
X_k1k2=Ac_k1*B*Ar_k2';
subplot(2,2,2)
imshow(X_k1k2,[])
title('naive approach')
subplot(2,2,3)
imshow(X_tsvd,[])
title('tsvd method')
subplot(2,2,4)
imshow(X_tikh,[])
title('tikhonov method')