%%benchmark 3-graph
%2 nodes 1 in 2 out

a1 = Ark('-','x0','x1',1);
a2 = Ark('-','x0','x1',1);
a3 = Ark('-','x1','x2',1);

a4 = Ark('-','x1','x2',1);
a5 = Ark('-','x1','x2',1);
a6 = Ark('-','x2','x1',1);

list = {a1 a2 a3 a4 a5 a6};