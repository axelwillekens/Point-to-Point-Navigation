%plotten fout
X_c=(X.Data+Y.Data)/2;
Y_c=X_c;
d=sqrt((X_c-X.Data).^2+(Y_c-Y.Data).^2);
for i = 1:size(d)
    if Y.data(i) < X.Data(i)
        d(i) = -d(i);
    end
end
plot(d)
xlabel('# samples');
ylabel('error [m]');
axis([0 3000 -0.9 0.2]);
grid on
