cosfile = 'metingen/slinger7.1.log';
trackfile = 'tracks/slinger7_new.csv';

cosLL = csvread(cosfile);
trackLL = csvread(trackfile);

cosUTM = repmat(cosLL,1);
for c=1:size(cosLL,1)
    [x,y,zone] = ll2utm(cosLL(c,:),31);
    cosUTM(c,1) = x;
    cosUTM(c,2) = y;
end

trackUTM = repmat(trackLL,1);
for c=1:size(trackLL,1)
    [x,y,zone] = ll2utm(trackLL(c,:),31);
    trackUTM(c,1) = x;
    trackUTM(c,2) = y;
end

plot(trackUTM(:,1),trackUTM(:,2));
hold on
plot(cosUTM(:,1),cosUTM(:,2));
hold on
plot(cosUTM(1,1),cosUTM(1,2),'r*')  % marking the 10th data point of x and y
hold off
xlabel('X positie [m]');
ylabel('Y positie [m]');
legend({'(X_r, Y_r)','(X, Y)'},'Location','northeast')