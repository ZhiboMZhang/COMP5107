function [mu_cap,cov_cap] = ml(class,N,d)
% estimate data distribution with maximum-likelihood method
% parameter class is the sample data, N is the number of points, d is dimensions
mu_sum=zeros(1,d);
cov_sum=zeros(d,d);
for n=1:N
    mu_sum=mu_sum+class(n,:);
end
mu_cap=(mu_sum/N)';
for n=1:N
    metadata=(class(n,:)'-mu_cap)*(class(n,:)'-mu_cap)';
    cov_sum=cov_sum+metadata;
end
cov_cap=cov_sum/N;
end

