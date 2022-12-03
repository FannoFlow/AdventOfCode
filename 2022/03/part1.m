
data = parseInput("input.txt");

halfLength = strlength(data) / 2;
firstHalf = arrayfun(@(s) string(unique(s{1})), data.extractBefore(halfLength + 1));
secondHalf = arrayfun(@(s) characterListPattern(unique(s{1})), data.extractAfter(halfLength));

uniqueChars = firstHalf.extract(secondHalf);

scoreDict = dictionary([string(('a':'z').') ; string(('A':'Z').')], (1:52).');

answer = sum(scoreDict(uniqueChars));