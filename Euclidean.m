function [dist] = Euclidean(train,test,d)
sum=0;
for i=1:d
    dd=(train(i)-test(i))^2;
    sum=sum+dd;
end
dist=sqrt(sum);
end

