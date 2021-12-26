function [bounds, onoff] = parseInput(inputFile)

rawData = readlines(inputFile);

preprocessed = rawData.erase(["x","y","z","="]).split([" " ","]);

onoff = matlab.lang.OnOffSwitchState(preprocessed(:,1));
preprocessed(:,1) = [];

bounds = preprocessed.split("..").double();

end

