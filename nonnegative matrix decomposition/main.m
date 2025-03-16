r=20;m=25;n=30;
iter=2000;
times=2*r;
Error1= pic_error(r,m,n,iter,times,1);
plot(1:iter,log10(Error1),'Displayname','loop')
hold on
Error2= pic_error(r,m,n,iter,times,2);
plot(1:iter,log10(Error2),'Displayname','random')
hold on
Error3= pic_error(r,m,n,iter,times,3);
plot(1:iter,log10(Error3),'Displayname','weighted random')
title(['r=',num2str(r),'    m=',num2str(m),'    n=',num2str(n),'    times=',num2str(times)])
legend