function location = firstUniqueNChars(txt, N)

 txt = txt.split("").';
 txt(txt == "") = [];

circs = arrayfun(@(n) circshift(txt,-n), 0:N-1, UniformOutput=false);
circs = vertcat(circs{:});

location = find(sum(any(string(('a':'z').') == permute(circs,[3,1,2]), 2), 1) == N,1,"first") + N-1;

end