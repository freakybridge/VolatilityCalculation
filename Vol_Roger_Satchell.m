function vol = Vol_Roger_Satchell(md, yearlen)

o = md(:, 1);
h = md(:, 2);
l = md(:, 3);
c = md(:, 4);

r1 = log(h ./ l);
r2 = log(h ./ o);
r3 = log(l ./ c);
r4 = log(l ./ o);

r = r1 .* r2 + r3 .* r4;
n = size(r, 1);

vol = sqrt(1 / n * sum(r)); 
vol = vol * sqrt(yearlen);

end