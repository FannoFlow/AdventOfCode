
data = parseInput("input.txt");

oxygenData = data;
co2Data = data;

oxygenBits = [];
co2Bits = [];

column = 1;
while column <= size(data, 2)
    s = size(oxygenData,1);
    if s == 1
        oxygenBits(end+1) = oxygenData(1, column);
    else
        msb = (s - sum(oxygenData(:, column) == 1)) <= floor(s/2);

        oxygenBits(end+1) = msb;
        oxygenData(oxygenData(:, column) ~= msb, :) = [];
    end


    s = size(co2Data,1);
    if s == 1
        co2Bits(end+1) = co2Data(1, column);
    else
        lsb = (s - sum(co2Data(:, column) == 1)) > floor(s/2);

        co2Bits(end+1) = lsb;
        co2Data(co2Data(:, column) ~= lsb, :) = [];    
    end
    
    column = column + 1;
end

answer = bin2dec(string(oxygenBits).join("")) * bin2dec(string(co2Bits).join(""))