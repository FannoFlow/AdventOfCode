function data = parseInput(filename)

data = readtable(filename, TextType="string");
data.Properties.VariableNames = ["Direction", "Distance"];

end

