outer=1;
inner=10000;
step=[outer,inner];
step_sum=outer*inner;

%test problem
%[A,b,x_exact] = deriv2 (200,3); test='deriv2';     %consistent  ill-posed
%[A,b,x_exact] = blur (32,3,0.7); test='blur';     %consistent  well-posed
%[A,b,x_exact] = gravity (128,1,2,3,4);test='gravity'     %consistent  ill-posed
%[A,b,x] = phillips (64);'test='phillips';                  %a bit  ill-posed
seed=rand(1);                                               %get seed for producing gaussian
[A,b,x_exact] = gaussian_producer(256,256,seed);test='gaussian';   %consistent  

cond_number=condest(A);

%problem_kind
problem_kind='simple';
%problem_kind='SPD';
%problem_kind='lsqr';

%sketch_method
%method_r=["discrete","discrete convenient","gaussian"];
method_r=["discrete","discrete convenient"];
method_d=["residual","greedy surrogate"];
number_r=size(method_r,2);
number_d=size(method_d,2);

q=1;

for i=1:number_r
    sketch_method=char(method_r(1,i));    %remember to transform str2char
    [x,res,error] = reflection_sketch(A,b,x_exact,problem_kind,sketch_method,step,q);
    subplot(1,2,1)
    semilogy(1:step_sum,res','DisplayName',sketch_method)
    hold on
    subplot(1,2,2)
    semilogy(1:step_sum,error','DisplayName',sketch_method)
    hold on
end
for i=1:number_d
    sketch_method=char(method_d(1,i));    %remember to transform str2char
    [x,res,error]= reflection_sketch(A,b,x_exact,problem_kind,sketch_method,step,q);
    subplot(1,2,1)
    semilogy(1:step_sum,res','*-','DisplayName',sketch_method)
    hold on
    subplot(1,2,2)
    semilogy(1:step_sum,error','*-','DisplayName',sketch_method)
    hold on
end
subplot(1,2,1)
xlabel('iteration times')
ylabel('relative residual')
legend('location','best','FontSize', 6)
subplot(1,2,2)
xlabel('iteration times')
ylabel('relative error')
legend('location','best','FontSize', 6)
set(gcf, 'Position', [300 300 800 300])
sgtitle(['reflection-method   ','inner=',num2str(inner),'    outer=',num2str(outer),'   test-problem:',test,'  cond-number=',num2str(cond_number)])
