function G=GCV(alpha,bhat,s)
phi=1./(s.^2+alpha^2);
G=sum((bhat.*phi).^2)/(sum(phi)^2);
end