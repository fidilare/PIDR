%%benchmark 4-graph
%3 nodes 2 in 2 out no cycles

a1 = Ark('-','x0','x1',1);
a2 = Ark('-','x0','x1',1);
a3 = Ark('-','x1','x0',1);
a4 = Ark('-','x1','x0',1);

a5 = Ark('-','x1','x2',1);
a6 = Ark('-','x1','x2',1);
a7 = Ark('-','x2','x1',1);
a8 = Ark('-','x2','x1',1);

list = {a1 a2 a3 a4 a5 a6 a7 a8};
