cosfile = 'metingen/line1.9.log';
trackfile = 'tracks/track_18mm_line.csv';
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
a = (y2-y1)/(x2-x1);
b = -a*x1+y1;

error = zeros(size(cosUTM,1),1);
for c=1:size(cosUTM,1)
    X_curr = cosUTM(c,1);
    Y_curr = cosUTM(c,2);
    x = (a*(X_curr+x1) + (Y_curr - y1))/(2*a);
    y = a*(X_curr-x) + Y_curr;
    d = sqrt((x-X_curr)^2 + (y-Y_curr)^2);
    if Y_curr < a*X_curr+b
        error(c) = d;
    else
        error(c) = -d;
    end
end

plot(error);
xlabel('# samples');
ylabel('fout [m]');
grid on
