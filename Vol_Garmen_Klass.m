function vol = Vol_Garmen_Klass(md, yearlen)

o = md(:, 1);
h = md(:, 2);
l = md(:, 3);
c = md(:, 4);

r1 = log(h ./ l) .^ 2;
r2 = log(c ./ o) .^ 2;

r = 0.5 * r1 - 2 * (log(2) - 1) * r2;
n = size(r, 1);

vol = sqrt(1 / n * sum(r)); 
vol = vol * sqrt(yearlen);

end