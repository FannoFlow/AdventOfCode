% part 1 script

clear
clc

[bounds, onoff] = parseInput("reboot.txt");

% post process, dont care about the bounds
bounds = bounds - min(bounds, [], "all") + 1;

numOn = 0;
for i = 1:max(bounds, [], "all")^3
    

end

for i = 1:numel(onoff)
    x = bounds(i,1,1):bounds(i,1,2);
    y = bounds(i,2,1):bounds(i,2,2);
    z = bounds(i,3,1):bounds(i,3,2);

    x = clipBBox(x, bbox, offset);
    y = clipBBox(y, bbox, offset);
    z = clipBBox(z, bbox, offset);

    if isempty(x) || isempty(y) || isempty(z)
        continue
    end

    cube(x, y, z) = onoff(i);
end

nnz(cube)


function data = clipBBox(data, bbox, offset)

data(data < (bbox(1) + offset)) = [];
data(data > (bbox(2) + offset)) = [];

end