function [w,w0] = Fisher(mu1,mu2,cov1,cov2)
% Fisher’s Discriminant Method
    w=((cov1+cov2).^(-1))*(mu1-mu2)';
    y1=w'*mu1';
    y2=w'*mu2';
    w0=-1/2*(y1+y2);
end

