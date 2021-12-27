
[data, moves] = parseInput("input.txt");

tf = false(size(data));

for m = moves.'

tf(data == m) = true;

boardWin = any(all(tf, 1), 2) | any(all(tf, 2), 1);
winningBoardLocation = find(boardWin, 1);

if ~isempty(winningBoardLocation)
    break
end

end

winningBoard = data(:, :, winningBoardLocation);
winningTF = tf(:, :, winningBoardLocation);

answer = sum(winningBoard(~winningTF)) .* m

