function [A,b,x_exact] = gaussian_producer(m,n,seed)

x_exact=ones(n,1);

A=zeros(m,n);

rng('shuffle')    %������������ô�ð�������������
for i=1:m
    A(i,:)=mvnrnd(zeros(n,1),eye(n))';
end

b=A*x_exact;
end

