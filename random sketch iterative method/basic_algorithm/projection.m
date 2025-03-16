function x= projection(A,b,k1,x)
r=b(k1,1)-A(k1,:)*x;
alpha=r/norm(A(k1,:),2)^2;
x=x+1*alpha*A(k1,:)';
end

