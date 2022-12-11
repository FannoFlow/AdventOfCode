
g  = parseInput("input.txt");

dfTable = dfsearch(g,"/","allevents");

for i = size(dfTable,1):-1:1
    edge = dfTable.Edge(i,:);
    if (any(ismissing(edge)) || numel(edge) == 1)
        continue
    end

    node = edge(2);
    prevNode = edge(1);

    if isempty(g.predecessors(node))
        continue
    elseif isempty(g.successors(node))
        weight = sum(g.Edges.Weight(g.findedge(prevNode,node)));
    else
        weight = sum(g.Nodes.FolderSize(g.findnode(node)));
    end

    g.Nodes.FolderSize(g.findnode(prevNode)) = g.Nodes.FolderSize(g.findnode(prevNode)) + weight;
end

maxSize = 100000;

answer = sum(g.Nodes.FolderSize(g.Nodes.FolderSize > 0 & g.Nodes.FolderSize < maxSize));

