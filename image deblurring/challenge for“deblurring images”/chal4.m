k1=46;
k2=60;
[c1,c2,c3]=svd(Ac);
[r1,r2,r3]=svd(Ar);
Ac_k1=c3(:,1:k1)*inv(c2(1:k1,1:k1))*c1(:,1:k1)';
Ar_k2=r3(:,1:k2)*inv(r2(1:k2,1:k2))*r1(:,1:k2)';
Xnaive=inv(Ac)*B*inv(Ar');
%imshow(Xnaive,[])
X_k1k2=Ac_k1*B*Ar_k2';
imshow(X_k1k2,[])
%the question is not what you look at, but what you see 作者还是看不清