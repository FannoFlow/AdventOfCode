
data = parseInput("input.txt");

summary = groupsummary(data, "Direction", "sum");

horizontal = summary.sum_Distance(summary.Direction == "forward");
vertical = summary.sum_Distance(summary.Direction == "down") - summary.sum_Distance(summary.Direction == "up");

answer = horizontal * vertical