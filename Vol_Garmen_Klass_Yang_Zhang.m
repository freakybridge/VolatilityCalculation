function vol = Vol_Garmen_Klass_Yang_Zhang(md, yearlen)

o = md(2 : end, 1);
h = md(2 : end, 2);
l = md(2 : end, 3);
ct = md(2 : end, 4);
ct_1 = md(1 : end - 1, 4);

r1 = log(h ./ l) .^ 2;
r2 = log(ct ./ o) .^ 2;
r3 = log(o ./ ct_1) .^ 2;
r = 0.5 * r1 - (2 * log(2) - 1) * r2 + r3;

n = size(r, 1);
vol = sqrt(1 / n * sum(r)); 
vol = vol * sqrt(yearlen);

end