function data = parseInput(filename)
    data = readlines(filename);
    data(data == "") = [];
    data = data.split(" ");
end

