function data = parseInput(filename)
    data = readlines(filename).split([",","-"]).double();
end

