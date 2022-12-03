
data = parseInput("input.txt");

% R > C -> 1 > 3 -> A > C
% P > R -> 2 > 1 -> B > A
% C > P -> 3 > 2 -> C > B

stratMap = dictionary("X", "A", "Y", "B", "Z", "C");
pointsMap = dictionary("A", 1, "B", 2, "C", 3);

playerData = stratMap(data(:,2));
enemyData = data(:,1);

points = @(player, enemy) pointsMap(player) + (3 * (player == enemy)) + ...
    (6 * any([ ...
        (player == "A") & (enemy == "C"), ...
        (player == "B") & (enemy == "A"), ...
        (player == "C") & (enemy == "B")
    ], 2));

score = sum(points(playerData, enemyData));
