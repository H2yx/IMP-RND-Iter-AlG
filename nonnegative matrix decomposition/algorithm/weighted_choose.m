function w = weighted_choose(column,weight)
prob=weight/sum(weight);
r=rand;
temp=0;
i=0;
while temp<=r
    i=i+1;
    temp=temp+prob(i,1);
w=column(1,i);
end

