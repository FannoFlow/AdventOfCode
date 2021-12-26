function data = parseInput(filename)

data = readlines(filename).split("").double();
data(:, [1, end]) = [];

end

