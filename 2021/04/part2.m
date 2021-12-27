
[data, moves] = parseInput("input.txt");

tf = false(size(data));
prevBoardWin = false(1,1,size(data, 3));

for m = moves.'

    tf(data == m) = true;

    boardWin = any(all(tf, 1), 2) | any(all(tf, 2), 1);

    if all(boardWin)
        winningBoardLocation = find(~prevBoardWin, 1);
        break
    end

    prevBoardWin = boardWin;

end

winningBoard = data(:, :, winningBoardLocation);
winningTF = tf(:, :, winningBoardLocation);

answer = sum(winningBoard(~winningTF)) .* m