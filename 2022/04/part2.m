
data = parseInput("input.txt");

% spent too long trying to find a cheeky solution.
% graciously copied from Daniel :)
% https://pastebin.com/jxKR9udC

answer = sum((data(:,1) >= data(:,3) & data(:,1) <= data(:,4)) |...
(data(:,2) >= data(:,3) & data(:,2) <= data(:,4)) |...
(data(:,3) >= data(:,1) & data(:,3) <= data(:,2)) |...
(data(:,4) >= data(:,1) & data(:,4) <= data(:,2)));