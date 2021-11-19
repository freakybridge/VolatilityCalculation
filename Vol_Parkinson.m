function vol = Vol_Parkinson(md, yearlen)

r = log(md(:, 2) ./ md(:, 3));
r = r .* r;

n = size(r, 1);
vol = sqrt(1 / (4 * n * log(2)) * sum(r)); 
vol = vol * sqrt(yearlen);

end