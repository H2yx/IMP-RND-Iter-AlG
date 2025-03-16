function [W,H] = initial(V,W,H)
alpha=sum(sum(V.*(W*H)))/sum(sum((W*H).*(W*H)));  %initialization method on page286
H=H*sqrt(alpha);
W=W*sqrt(alpha);
end

