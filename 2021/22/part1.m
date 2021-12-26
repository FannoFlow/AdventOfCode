% part 1 script

clear
clc

[bounds, onoff] = parseInput("input.txt");

cube = false(101,101,101);

bbox = [-50, 50];

offset = -bbox(1) + 1;

bounds = bounds + offset;


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