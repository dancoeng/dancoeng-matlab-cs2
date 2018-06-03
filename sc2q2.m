%%programa para questão 2
clear,clc

%parametros da planta
nump=2;
denp=[8 6 1];
P=tf(nump,denp);

%parametros do controlador PID
hold on
for K=1:10:100;
numc=[1 5];
denc=[0 1 10];
%K=2;
C=K*tf(numc,denc);
%O sistema em malha aberta
Y=series(C,P);
Y=feedback(Y,1)
%step(P)
step(Y)
%legend('P','Y','location','best')
%rlocus(Y)
%sisotool(Y)
end
hold off