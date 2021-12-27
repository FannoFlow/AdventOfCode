
data = parseInput("input.txt")+1;

ocean = zeros(max(data, [], "all"));

for i = 1:size(data, 1)
    x1 = data(i,1,1);
    x2 = data(i,1,2);
    y1 = data(i,2,1);
    y2 = data(i,2,2);
    if (x1 ~= x2) && (y1 ~= y2)
        continue
    end

    x = x1:sign(x2+0.1-x1):x2;
    y = y1:sign(y2+0.1-y1):y2;
    ocean(y,x) = ocean(y,x) + 1;
end

answer = nnz(ocean > 1)