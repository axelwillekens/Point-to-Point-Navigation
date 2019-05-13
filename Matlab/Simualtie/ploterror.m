%plotten fout
X_c=(X.Data+Y.Data)/2;
Y_c=X_c;
plot(sqrt((X_c-X.Data).^2+(Y_c-Y.Data).^2))
xlabel('# samples');
ylabel('error [m]');
axis([0 5000 0 0.9]);
grid on
