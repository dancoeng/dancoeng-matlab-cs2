clear,clc
hold off %desliga o mantenedor de grahficos nos eixos do grahfico 
%parametros
num=[1 5];
den=[1 10];
Ts=1/100;
T=20*Ts;


%%letra c
G=tf(num, den) %funcsano de transferencia
Gzoh=c2d(G,Ts,'zoh'); %equivalente discreto Z pelo mehtodo ZOH para Ts=0.2

%%letra d
Gzohl=c2d(G,T,'zoh') %equivalente discreto Z pelo mehtodo ZOH para Ts=4
%%letra e
hold on %liga o mantenedor de grahficos nos eixos do grahfico 
step(G) %plota a funcsano de transferencia
step(Gzoh)%plota o equivalente discreto para Ts=0.2
step(Gzohl)%plota o equivalente discreto para Ts=4
title('comparativo G(s), G(z)_{p} G(z)_{pl}')
legend('G(s)','G(z) Ts=0.2','G(z) Ts=4')
print('1a_e.png','-dpng') %grava uma imagem do grahfico acima
hold off
%%letra g (nano consegui ainda)
%xl=[0 2+2*e^(-0.5*Ts)-4*e^(-0.75*Ts) 2*e^(-1.25*Ts)+2*e^(-0.75*Ts)-4*e^(-0.5)*Ts];
%yl=[1 -e^(-0.5*Ts)-e^(-0.75*Ts) e^(-1.25*Ts)];
%plot(xl,yl);
