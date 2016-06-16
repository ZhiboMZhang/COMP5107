function [a,b] = HoKashyap(w1,w2,d)
% Ho‐Kashyap Rule Method
% build traiing sample and tesing sample
train_class1=[];
train_class2=[];
train=[];
N1=length(w1);
N2=length(w2);
for i=1:N1
    train_class1=[train_class1;w1(i,:)];
end
for i=1:N2
    w2(i,:)=zeros(1,d)-w2(i,:);
    train_class2=[train_class2;w2(i,:)];
end
train=[train_class1;train_class2];
a=ones(d,1);
b=ones(d,1);
c=-1;
NT=length(train);
for i=1:NT
    e=train(i,:)*a-b;
    ej=(1/2)*(e+abs(e));
    b=a+2*c*ej;
    yj=(train(i,:)*train(i,:)')^(-1)*train(i,:);
    a=yj*b*ones(d,1);
end
end
