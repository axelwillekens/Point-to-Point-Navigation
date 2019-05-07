t = 0:1:1000;
t_short = 0:1:200;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Figure 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(211), plot(t,res.data(1:1001,1),'--',t,rese.data(1:1001,1),'-'), 
xlabel('# samples'), ylabel('x')
axis([0 1000 0.5 3]);
legend({'Exact','Estimation'})

subplot(212), plot(t,res.data(1:1001,1)-resv.data(1:1001,1),'-.',t,res.data(1:1001,1)-rese.data(1:1001,1),'-'),
xlabel('# samples'), ylabel('Error x')
axis([0 1000 -0.25 0.25]);
legend({'Noise','Estimation error'})
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Figure 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(211), plot(t,res.data(1:1001,2),'--',t,rese.data(1:1001,2),'-'), 
xlabel('# samples'), ylabel('v_x')
%axis([0 1000 -1 -0.15]);
legend({'Exact','Estimation'})

subplot(212), plot(t,res.data(1:1001,2)-resv.data(1:1001,2),'-.',t,res.data(1:1001,2)-rese.data(1:1001,2),'-'),
xlabel('# samples'), ylabel('Error v_x')
axis([0 1000 -0.4 0.4]);
legend({'Noise','Estimation error'})
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Figure 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(211), plot(t,res.data(1:1001,3),'--',t,rese.data(1:1001,3),'-'), 
xlabel('# samples'), ylabel('y')
%axis([0 1000 -1 -0.15]);
legend({'Exact','Estimation'})

subplot(212), plot(t,res.data(1:1001,3)-resv.data(1:1001,3),'-.',t,res.data(1:1001,3)-rese.data(1:1001,3),'-'),
xlabel('# samples'), ylabel('Error y')
axis([0 1000 -0.25 0.25]);
legend({'Noise','Estimation error'})
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Figure 4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(211), plot(t,res.data(1:1001,4),'--',t,rese.data(1:1001,4),'-'), 
xlabel('# samples'), ylabel('v_y')
%axis([0 1000 -1 -0.15]);
legend({'Exact','Geschat'})

subplot(212), plot(t,res.data(1:1001,4)-resv.data(1:1001,4),'-.',t,res.data(1:1001,4)-rese.data(1:1001,4),'-'),
xlabel('# samples'), ylabel('Fout v_y')
axis([0 1000 -0.3 0.3]);
legend({'Ruis','Geschatte fout'})
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Figure 5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(211), plot(t,res.data(1:1001,5),'--',t,rese.data(1:1001,5),'-'), 
xlabel('# samples'), ylabel('theta')
%axis([0 1000 -1 -0.15]);
legend({'Exact','Geschat'})

subplot(212), plot(t,res.data(1:1001,5)-resv.data(1:1001,5),'-.',t,res.data(1:1001,5)-rese.data(1:1001,5),'-'),
xlabel('# samples'), ylabel('Fout theta')
axis([0 1000 -0.5 0.5]);
legend({'Ruis','Geschatte fout'})
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Figure 6 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(211), plot(t,res.data(1:1001,6),'--',t,rese.data(1:1001,6),'-'), 
xlabel('# samples'), ylabel('omega')
axis([0 1000 -1 -0.15]);
legend({'Exact','Geschat'})

subplot(212), plot(t,res.data(1:1001,6)-resv.data(1:1001,6),'-.',t,res.data(1:1001,6)-rese.data(1:1001,6),'-'),
xlabel('# samples'), ylabel('Fout omega')
%axis([0 1000 -1 -0.15]);
legend({'Ruis','Geschatte fout'})
