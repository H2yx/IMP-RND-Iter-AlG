function S= parameter_producer(m,n,problem_kind,sketch_method,q,A,p,r,feature)


% INPUT
% m&n  the size of linear system
% A    from the linear system

% problem_kind    SPD matrix defining the inner product and then the 'problem kind'.
%      'simple'  B=I
%      'SPD'   B=A
%      'lsqr'  B=A'*A

% sketch_method    "S" methods of sketching
% RANDOM_distribuition_fixed:
%      'discrete'  equal probability for row of A (e_i)¡Ì
%      'discrete convenient'   a kind of probability for row of A proposed
%      by"2015 randomized",available for q>1; (e_i)¡Ì
%      'gaussian'  the row of S subject to gaussian distribution ¡Ì
% RANDOM_distribuition_flexibile:
%      'p'  a kind of probability for row of A based on p-norm of resdual
% DETERMINISTIC:
%      'residual'  residual-based surrogate hyperplane Kaczmarz method (r)¡Ì
%      'greedy  surrogate' a greedy  row selection proposed by Chen¡Ì

% q    columns of S,especially q=1 means vector form,others mean block

% p    the porbabilty for random_distribuition(if can be generated in advance)

% r    the residual

% feature    row norm about A

% OUTPUT
% x    iterative solution
% res  relative residual

if strcmp(problem_kind ,'lsqr')
    m1=m;
else
    m1=m; %n£¿
end

switch sketch_method
    case 'discrete'
        I=speye(m1);
        index=randperm(m1,q);
        S=I(:,index);
    case 'discrete convenient'
        I=speye(m1);
        column=(1:m)';
        index=weighted_choose(column,p); % difficult to apply to q>1 on code
        S=I(:,index);
    case 'gaussian'
        S=zeros(m1,q);
        for i=1:q
            S(:,i)=mvnrnd(zeros(m1,1),eye(m1));
        end
    case 'residual'
        S=zeros(m1,q);% q must be 1 ???
        S(:,q)=r;
    case 'greedy surrogate'
        eta=norm(r,2);
        [max_val,max_idx]=max(r.^2./feature);
        truncation=(1/2)*((1/eta)*max_val+1/sum(feature));
        surrogate=zeros(m,1);
        index=0;
        for i=1:m
            if r(i,1)^2>truncation*eta*feature(i,1)
                surrogate(i,1)=r(i,1);
                index=1;
            end
            if index==0
                surrogate(max_idx,1)=r(max_idx,1);
            end
        end
        S=surrogate;
end
if strcmp(problem_kind ,'lsqr')
    S=A*S;
end
end

