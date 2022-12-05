
data = parseInput("input.txt");

data = permute(reshape(data.', 2, 2, []), [3,1,2]);
answer = sum(~all(min(data, [], [2,3]) + diff(data, 1, 2) - max(data, [], [2,3]) < 0, 3));
