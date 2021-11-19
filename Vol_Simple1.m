function vol = Vol_Simple1(md, yearlen)

r = log(md(2 : end, 4) ./ md(1 : end - 1, 4));
r_ = mean(r);
r(:, 2) = r - r_;
r(:, 3) = r(:, 2) .* r(:, 2);

n = size(r, 1);

vol = sqrt(1 / (n - 1) * sum(r(:, 3)) * yearlen);

end