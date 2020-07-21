function matrix = matrix (A)
% This function calculates the sought consistent matrix of theorem 2.5
B = log (A);
[n m]=size (A);
Y = y (n);
X = zeros (size (A));
for i = 1:n - 1
 phiy = Y (:, i)*ones (1, n)-ones (n, 1)*Y (:, i)';
 factor = trace (B'*phiy)/(i + i^2);
 X = X + factor * phiy;
end
X = X/(2 * n);
matrix = exp (X);

