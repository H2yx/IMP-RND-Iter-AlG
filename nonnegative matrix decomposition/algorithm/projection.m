function v= projection(v)
[m,n]=size(v);
for i=1:m
    for j=1:n
        v(i,j)=max(v(i,j),0);
    end
end
end

