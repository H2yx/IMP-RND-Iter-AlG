function [A,b,x_exact] = gaussian_singular_producer(m,n,extra,seed)


A=zeros(m,n);

rng('shuffle')    %这个随机数该怎么用啊啊啊啊啊啊啊
for i=1:m
    A(i,:)=mvnrnd(zeros(n,1),eye(n))';
end
temp=A(:,1:extra);
A=[A,temp];

x_exact=ones(n+extra,1);

for i=1:n+extra
    if i<=n
        x_exact(i,1)=x_exact(i,1)+1;
    else
        x_exact(i,1)=x_exact(i,1)-1;
    end
end
b=A*x_exact;

end

