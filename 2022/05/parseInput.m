function [crates, moves] = parseInput(filename)
    txt = readlines(filename);

    moves = txt(txt.contains("move"));
    moves = moves.erase(["move ", "from", "to"]).split(" ").double();
    moves(isnan(moves)) = [];
    moves = reshape(moves, [], 3);
    
    crates = txt(txt.contains("["));
    crates = string(char(crates).').erase(["[", "]", " "]);
    crates(crates.strlength() == 0) = [];
    crates = crates.pad(max(crates.strlength()), "left");
    crates = crates.split("").';
    crates([1, end], :) = [];
    crates = flipud(crates).erase(" ");
end

