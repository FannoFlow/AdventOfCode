data = parseInput("input.txt");

answer = nnz(diff(movsum(data, 3, Endpoints="discard")) > 0)