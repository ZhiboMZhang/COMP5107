function [group] = KNN(train,test,k,d)
% k Nearest Neighbor Method
% train:training data
% test: testing data point
% k: number of neighbors
% d: dimension of the vector
NA=length(train);
distm=[];
for i=1:NA
    dist=Euclidean(train(i,:),test,d);
    distm=[distm;dist];
end
[sa,oa]=sort(distm);
nearest=oa(1:k);
group1flag=0;
group2flag=0;
for i=1:k
    if(train(nearest(i),d+1)==0)
        group1flag=group1flag+1;
    else
        group2flag=group2flag+1;
    end
end
if(group1flag>=group2flag)
    group=0;
else
    group=1;
end
end

