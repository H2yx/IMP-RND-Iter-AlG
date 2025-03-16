function [x,res,err] = reflection_sketch(A,b,x_exact,problem_kind,sketch_method,step,q)

% INPUT
% A&b&x_eaxct  the linear system

% problem_kind    SPD matrix defining the inner product and then the 'problem kind'.
%      'simple'  B=I
%      'SPD'   B=A
%      'lsqr'  B=A'*A

% sketch_method   "S" methods of sketching
%      see parameter_producer.m for detail

% step=[outer,inner] times of iteration
% inner times of reflection in each averaging routine
% outer times of averaging routine

% q    columns of S,especially q=1 means vector form,others mean block

% OUTPUT
% x    iterative solution
% res  relative residual
% err  relative error

outer=step(1,1);
inner=step(1,2);
step=outer*inner;
alpha=norm(x_exact,2);
beta=norm(b,2);
[m,n]=size(A);
%x=ones(m,1);
x=zeros(m,1);
res=zeros(step,1);
err=zeros(step,1);
r=b;               %initialization  0 as initial guess

switch problem_kind
    case 'simple'
        B=speye(n);
    case 'SPD'
        B=A;
    case 'lsqr'
        B=A'*A;
        
end                % get B

if nargin ==6
    q=1;
end                % get q

p=zeros(m,1);
switch sketch_method
    case 'discrete convenient'
        for i=1:m
            p(i,1)=A(i,:)*(B\A(i,:)');
        end
end
% get  prob for RANDOM_distribuition_fixed sketch to avoid repeating

feature=zeros(m,1);
switch sketch_method
    case 'greedy surrogate'
        for i=1:m
            feature(i,1)=norm(A(i,:),2)^2;
        end
end
% get row norm of A(square)


x_average=2*ones(n,1);
x_average(1,1)=1;
%x_average=zeros(n,1);

for j=1:outer
    x=x_average;
    for i=1:inner
        S=parameter_producer(m,n,problem_kind,sketch_method,q,A,p,r,feature);
        temp=S'*r;
        sketch=A'*S;
        temp=(sketch'*(B\sketch))\temp;
        temp=sketch*temp;
        temp=B\temp;
        x=x+2*temp;                                     %update the reflection
        x_average=(i/(i+1))*x_average+(1/(i+1))*x;          %update the avergae
        r=b-A*x_average;                                %update the residual
        res((j-1)*inner+i,1)=norm(r,2)/beta;
        error=x_exact-x_average;                        %update the error
        err((j-1)*inner+i,1)=norm(error,2)/alpha;
    end
end

