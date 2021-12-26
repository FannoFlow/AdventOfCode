
data = parseInput("input.txt");

s = size(data,1);
msb = (s - sum(data == 1)) < floor(s/2);
lsb = ~msb;

answer = bin2dec(string(double(msb)).join("")) * bin2dec(string(double(lsb)).join(""))