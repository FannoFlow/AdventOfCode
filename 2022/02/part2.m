
data = parseInput("input.txt");

% R > C -> 1 > 3 -> A > C
% P > R -> 2 > 1 -> B > A
% C > P -> 3 > 2 -> C > B

pointsMap = dictionary("A", 1, "B", 2, "C", 3);

loseMap = dictionary("A", "C", "B", "A", "C", "B");
drawMap = dictionary("A", "A", "B", "B", "C", "C");
winMap = dictionary("A", "B", "B", "C", "C", "A");

moveMap = dictionary("X", {loseMap}, "Y", {drawMap}, "Z", {winMap});

enemyData = data(:,1);
playerData = cellfun(@(d, x) d(x), moveMap(data(:,2)), enemyData);


points = @(player, enemy) pointsMap(player) + (3 * (player == enemy)) + ...
    (6 * any([ ...
        (player == "A") & (enemy == "C"), ...
        (player == "B") & (enemy == "A"), ...
        (player == "C") & (enemy == "B")
    ], 2));

score = sum(points(playerData, enemyData));

