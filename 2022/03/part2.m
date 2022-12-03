
data = parseInput("input.txt");

uData = arrayfun(@(s) string(unique(s{1})), data);

groups = reshape(uData, 3, []).join("", 1);

scoreDict = dictionary([string(('a':'z').') ; string(('A':'Z').')], (1:52).');

answer = sum(scoreDict(cellfun(@(s) string(mode(s)), groups)));

