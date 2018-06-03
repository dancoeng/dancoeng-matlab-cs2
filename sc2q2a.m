clear,clc
num = [2];den = [8 6 1];
printsys(num,den,'s')
step(num,den)
pause()
hold on
T = 0.2;
[numd,dend]=c2dm(num,den,T);
printsys(numd, dend,'z')
dstep(numd,dend)
pause()
T = 4; 
[numd,dend] = c2dm(num, den, T);
printsys(numd,dend,'z')
dstep(numd,dend)
pause()
hold off