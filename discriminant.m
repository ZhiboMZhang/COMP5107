function [A,B,C]=discriminant(mu1,mu2,sigma1,sigma2,p1,p2)
% Quadratic Discriminant Classification Method
    A=(sigma2^-1)-(sigma1^-1);
    B=2*(mu1*(sigma1^-1)-mu2*(sigma2^-1));
    C=(mu2*(sigma2^-1)*mu2'-mu1*(sigma1^-1)*mu1')-2*(log(p2/p1)+log(det(sigma1)/det(sigma2)));
end
