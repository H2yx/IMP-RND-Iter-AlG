function [x,res,err] = projection_sketch(A,b,x_exact,problem_kind,sketch_method,step,q)


% INPUT
% A&b&x_eaxct  the linear system

% problem_kind    SPD matrix defining the inner product and then the 'problem kind'.
%      'simple'  B=I
%      'SPD'   B=A
%      'lsqr'  B=A'*A

% sketch_method   "S" methods of sketching
%      see parameter_producer.m for detail

% step   times of iteration

% q    columns of S,especially q=1 means vector form,others mean block

% OUTPUT
% x    iterative solution
% res  relative residual
% err  relative error

alpha=norm(x_exact,2);
beta=norm(b,2);
[m,n]=size(A);

%x=zeros(n,1);
x=2*ones(n,1);
x(1,1)=1;

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

for i=1:step
    S=parameter_producer(m,n,problem_kind,sketch_method,q,A,p,r,feature);
    temp=S'*r;
    sketch=A'*S;
    temp=(sketch'*(B\sketch))\temp;
    temp=sketch*temp;
    temp=B\temp;
    x=x+temp;
    r=b-A*x;
    res(i,1)=norm(r,2)/beta;
    error=x_exact-x; 
    err(i,1)=norm(error,2)/alpha;
end


