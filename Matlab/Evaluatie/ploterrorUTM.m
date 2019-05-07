cosfile = 'metingen/test3.log';
trackfile = 'tracks/track23-08-2018_11u12.csv';

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

x1 = trackUTM(1,1);
x2 = trackUTM(10,1);
y1 = trackUTM(1,2);
y2 = trackUTM(10,2);
rico = (y2-y1)/(x2-x1);

error = zeros(size(cosUTM,1),1);
for c=1:size(cosUTM,1)
    X_curr = cosUTM(c,1);
    Y_curr = cosUTM(c,2);
    x = (rico*(X_curr+x1) + (Y_curr - y1))/(2*rico);
    y = rico*(X_curr-x) + Y_curr;
    error(c) = sqrt((x-X_curr)^2 + (y-Y_curr)^2);
end

plot(error);
