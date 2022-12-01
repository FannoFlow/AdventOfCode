
data = parseInput("input.txt");

sums = accumarray(cumsum(isnan(data)) + 1, data, [], @(A) sum(A, 'omitnan'));

answer = max(sums);