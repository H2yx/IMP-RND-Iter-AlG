function [V,W,H]= test_maker(r,m,n)
W1=magic(m);
H1=magic(n);
W=W1(:,1:r);
H=H1(1:r,:);
V=W*H;
%W=rand(m,r);H=rand(r,n);
%W=ones(m,r);H=ones(r,n);
W=reshape(1:m*r,m,r);H=reshape(1:n*r,r,n);
end

