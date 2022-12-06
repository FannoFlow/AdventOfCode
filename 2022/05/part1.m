
[crates, moves] = parseInput("input.txt");

for move = moves.'
    s = sum(strlength(crates));
    n = move(1);
    from = move(2);
    to = move(3);
    fromRows = s(from):-1:s(from)-n+1;
    crates(s(to)+1:s(to)+n, to) = crates(fromRows, from);
    crates(fromRows, from) = "";
    crates = fillmissing(crates, constant="");
end

answer = crates.join("",1).extractAfter(sum(strlength(crates),1)-1).join("");