function [mu_cap,cov_cap] = bayesian(class,N,d,mu0,cov0,sigma)
% estimate data distribution with bayesian method
% parameters:
% class:number of the sample data's classes
% N:number of the sample data points
% d:dimension of the vector
% sigma:known covariance of the sample data
mu_sum=zeros(1,d);
for n=1:N
    mu_sum=mu_sum+class(n,:);
end
mu_sum=(mu_sum/N)';
metadata=(cov0+(sigma/N))^(-1);
mu_cap=cov0*metadata*mu_sum+(sigma/N)*metadata*mu0';
cov_cap=cov0*metadata*(sigma/N);
end

