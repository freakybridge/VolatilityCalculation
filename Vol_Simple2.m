function vol = Vol_Simple1(md, yearlen)

r = log(md(2 : end, 4) ./ md(1 : end - 1, 4));
r(:, 2) = r(:, 1) .* r(:, 1);

n = size(r, 1);

vol = sqrt(1 / n * sum(r(:, 2)) * yearlen);

end