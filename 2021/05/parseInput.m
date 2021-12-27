function data = parseInput(filename)

data = permute(readlines(filename).split(" -> ").split(",").double(), [1,3,2]);

end

