function W = rank1_update_W(V,W,H,method_index,times)
r=size(W,2);
norm_H=zeros(r,1);
for j=1:r
    norm_H(j,1)=norm(H(j,:),2);
end
%[m,n]=size(V);
for k=1:times
    switch method_index
        case 1
            i=mod(k,r);
            if i==0
                i=r;
            end
        case 2
            i=randi([1,r]);
        case 3
            column=1:r;
            i=weighted_choose(column',norm_H);
    end
    temp=V*H(i,:)';
    for j=[1:i-1,i+1:r]
        temp=temp-(H(i,:)*H(j,:)')*W(:,j);
    end
    W(:,i)=projection(temp)/norm_H(i,1)^2;
end            
end
