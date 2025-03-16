function H = rank1_update_H(V,W,H,method_index,times)
r=size(W,2);
norm_W=zeros(r,1);
for j=1:r
    norm_W(j,1)=norm(W(:,j),2);
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
            i=weighted_choose(column',norm_W);
    end
    temp=W(:,i)'*V;
    for j=[1:i-1,i+1:r]
        temp=temp-(W(:,i)'*W(:,j))*H(j,:);
    end
    temp=projection(temp)/norm_W(i,1)^2;
    if norm(temp,2)>1e-2
        H(i,:)=temp;
    end
end            
end

