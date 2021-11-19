function vol = Vol_Yang_Zhang(md, yearlen)


n = size(md, 1) - 1;
o = md(2 : end, 1);
h = md(2 : end, 2);
l = md(2 : end, 3);
ct = md(2 : end, 4);
ct_1 = md(1 : end - 1, 4);

r1 = log(o ./ ct_1);
r1 = r1 - mean(r1);
r1 = r1 .* r1;
sigma1 = (1 / (n - 1)) * sum(r1);

r2 = log(ct ./ o);
r2 = r2 - mean(r2);
r2 = r2 .* r2;
sigma2 = (1 / (n - 1)) * sum(r2);


r3 = log(h ./ l) .* log(h ./ o) + log(l ./ ct) .* log(l ./ o);
sigma3 = (1 / n) * sum(r3);


k = 0.34 / (1 + (n + 1) / (n - 1));
vol = sqrt(sigma1 + k * sigma2 + (1 - k) * sigma3);
vol = vol * sqrt(yearlen);
end