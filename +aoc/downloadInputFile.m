function downloadInputFile(year, day)
%DOWNLOADINPUTFILE downloads the desired input file of the AoC
%
% aoc.downloadInputFile( YEAR, DAY ) 
% Downloads the input file from the AOC site of the desired year and day
% The input file is saved as input.txt
%
% YEAR :Scalar integer of the desired year
% DAY  :Scalar integer of the desired day
%
% Examples:
%  Download the 2021 day 22 input file
%  aoc.downloadInputFile(2021, 22)

arguments
    year (1,1) uint16
    day (1,1) uint8
end

% unfortunetly doesn't work. looks like automated requests are blocked :(
websave("input.txt", compose("https://adventofcode.com/%d/day/%d/input", year, day));

end