clear,clc
hold off %desliga o mantenedor de grahficos nos eixos do grahfico 
%parametros
num=2;
den=[8 6 1];
Ts=1/5;
T=20*Ts;
%%letra c
G=tf(num, den) %funcsano de transferencia
Gzoh=c2d(G,Ts,'zoh') %equivalente discreto Z pelo mehtodo ZOH para Ts=0.2

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

%%letra g
y(3)=0;
for k=3:180
    if k<3, u(k)=0; else u(k)=1; end
y(k)=1.856*y(k-1)-0.8607*y(k-2)+0.004757*u(k-1)+0.004525*u(k-2);
end
t=-2:1:177;
plot(t,y)
title('comparativo G(s), G(z)_{p}, G(z)_{pl} e y(k)')
legend('G(s)','G(z) Ts=0.2','G(z) Ts=4','G(z) eq. de diferenças','location','best')
print('1a_g.png','-dpng') %grava uma imagem do grahfico acima

%%letra h
[A,B,C,D]=tf2ss(num,den)
[Ad,Bd,Cd,Dd]=c2dm(A,B,C,D,0.2)

%%letra i
dstep(Ad,Bd,Cd,Dd)
%conservar as legendas abaixo (apenas estética)
title('comparativo G(s), G(z)_{p}, G(z)_{pl} e y(k)') 
legend('G(s)','G(z) Ts=0.2','G(z) Ts=4','G(z) eq. de diferenças','location','best')
print('1a_g.png','-dpng') %grava uma imagem do grahfico acima

%%letra j
E=[Bd,Ad*Bd];
O=det([Cd;Cd*Ad]);
if E==0
    disp('o sistema não é controlável')
else
    disp('o sistema é controlável')
end
if O==0
    disp('o sistema não é observável')
else
    disp('o sistema é observável')
end

