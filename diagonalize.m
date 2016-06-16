function v=diagonalize(sigma1,sigma2)
% data whitening 
% d is dimensions, sigma1 is covariance matrice for class1
% sigma2 is covariance matrice for class 2
% stimulataneously diagonalize
[p1,ev1]=eig(sigma1);
cs=(ev1)^(-1/2)*p1'*sigma2*p1*(ev1)^(-1/2);
[p2,ev2]=eig(cs);
v=p2'*(ev1)^(-1/2)*p1';
end
