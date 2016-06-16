function [acy] = ac_leave_one_out(testclass1,testclass2,N1,N2,d)
% leave-one-out validation method for quandratic discriminant function
ac=0;
% training
if(N1<N2)
    N=N1;
else
    N=N2;
end
for i=1:N
    dvtrian1=[];
    dvtrian2=[];
    for n=1:N1
        if(n~=i)
            dvtrian1=[dvtrian1;testclass1(n,:)];
        end
    end
    for n=1:N2
        if(n~=i)
            dvtrian2=[dvtrian2;testclass2(n,:)];
        end
    end
    [mu_cap_class1,cov_cap_class1]=ml(dvtrian1,N1-1,d);
    [mu_cap_class2,cov_cap_class2]=ml(dvtrian2,N2-1,d);
    p1=(N1-1)/((N1-1)+(N2-1));
    p2=(N2-1)/((N1-1)+(N2-1));
    [A,B,C]=discriminant(mu_cap_class1',mu_cap_class2',cov_cap_class1,cov_cap_class2,p1,p2);
    ac_class1=accurancy(1,testclass1(i,:),A,B,C,1);
    ac_class2=accurancy(1,testclass2(i,:),A,B,C,0);
    ac_avg=(ac_class1+ac_class2)/2;
    ac=ac+ac_avg;
end
% testing
    acy=ac/N;
end
