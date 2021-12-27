function [data, moves] = parseInput(filename)

data = readlines(filename);

moves = data(1).split(",").double();
data(1) = [];
data(data == "") = [];
data = pagetranspose(reshape(data.erase(lineBoundary("start") + " ").replace("  ", " ").split().double().', 5,5,[]));

end

