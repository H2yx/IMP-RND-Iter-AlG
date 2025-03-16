function w = weighted_choose(column,weight)
weight=abs(weight);
prob=weight/sum(weight);
r=rand;
temp=0;
i=0;
while temp<=r
    i=i+1;
    temp=temp+prob(i,1);
w=column(i,1);
end

