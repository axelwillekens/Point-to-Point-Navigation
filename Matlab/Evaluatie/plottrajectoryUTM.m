cosfile = 'metingen/currpoint-19-3-2019_10u31.log';
trackfile = 'tracks/track23-08-2018_11u12.csv';

cosUTM = csvread(cosfile);
cosUTM = unique(cosUTM, 'rows');
trackLL = csvread(trackfile);

trackUTM = repmat(trackLL,1);
for c=1:size(trackLL,1)
    [x,y,zone] = ll2utm(trackLL(c,:),31);
    trackUTM(c,1) = x;
    trackUTM(c,2) = y;
end

plot(trackUTM(:,1),trackUTM(:,2));
hold on
plot(cosUTM(:,1),cosUTM(:,2));
hold off
xlabel('X positie [m]');
ylabel('Y positie [m]');
legend({'(X_r, Y_r)','(X, Y)'},'Location','northwest')