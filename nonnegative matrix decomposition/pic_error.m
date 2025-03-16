function Error= pic_error(r,m,n,iter,times,method_index)
[V,W,H]= test_maker(r,m,n);
norm_V=norm(V,'F');
[W,H] = initial(V,W,H);
Error=zeros(iter,1);
for i=1:iter
    H = rank1_update_H(V,W,H,method_index,times);
    W = rank1_update_W(V,W,H,method_index,times);
    Error(i,1)=norm(V-W*H,'F')/norm_V;
end
end

