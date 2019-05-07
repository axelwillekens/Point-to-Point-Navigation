%plotten traject
plot(X_r.data, Y_r.data);
hold on
plot(X.data, Y.data);
hold on
plot(X.data(1),Y.data(1),'r*')  % marking the 10th data point of x and y
hold off
xlabel('X positie [m]');
ylabel('Y positie [m]');
axis([-1 +10 -1 +10]);
legend({'(X_r, Y_r)','(X, Y)'},'Location','northwest')