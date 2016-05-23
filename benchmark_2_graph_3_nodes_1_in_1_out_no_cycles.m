%%benchmark 2-graph
%3 nodes 1 in 1 out no cycles

a1 = Ark('-','x0','x1',1);
a2 = Ark('-','x1','x0',1);

a3 = Ark('-','x1','x2',1);
a4 = Ark('-','x2','x0',1);

list = {a1 a2 a3 a4};