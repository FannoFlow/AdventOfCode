
data = parseInput("input.txt");

idxUp = data.Direction == "up";
idxDown = data.Direction == "down";
idxForward = ~(idxUp | idxDown);
data.Distance(idxUp) = -1 .* data.Distance(idxUp);
data.Aim = data.Distance;
data.Aim(idxForward) = 0;
data.Aim = cumsum(data.Aim);

answer = sum(data.Distance(idxForward)) * sum(data.Aim(idxForward) .* data.Distance(idxForward))