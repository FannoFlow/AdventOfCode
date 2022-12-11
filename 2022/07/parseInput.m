function g = parseInput(filename)

txt = readlines(filename);

g = digraph();
g = g.addnode(table("/", 0, VariableNames=["Name", "FolderSize"]));
currentNode = "/";

for l = txt.'
    if l.startsWith("$ cd ..")
        currentNode = txt.reverse().eraseBetween(1, "/",Boundaries='inclusive').reverse();
    elseif l.startsWith("$ cd")
        dirName = l.extractAfter("cd ");
        if (dirName == "/")
            currentNode = "/";
        else
            currentNode = currentNode + "/" + dirName;
        end
    elseif l.startsWith("dir ")
        dirName = l.extractAfter("dir ");
        g = addNodeAndEdge(g, getCurrentNode(currentNode), dirName, 0);
    elseif l.startsWith(digitsPattern(1))
        f = l.extractAfter(" ");
        s = l.extractBefore(" ").double();
        g = addNodeAndEdge(g, getCurrentNode(currentNode), f, s);
    end
end

g = g.simplify("sum","omitselfloops");

end

function node = getCurrentNode(currentNode)
if currentNode == "/"
    node = currentNode;
else
    node = currentNode.reverse().extractBetween(1, "/").reverse();
end
end

function g = addNodeAndEdge(g, from, to, weight)
if g.findnode(to) == 0
    g = g.addnode(table(to, 0, VariableNames=["Name", "FolderSize"]));
end
if g.findedge(from, to) == 0
    g = g.addedge(from, to, weight);
end
end