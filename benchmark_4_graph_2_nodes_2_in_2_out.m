%%benchmark 4-graph
%2 nodes 2 in 2 out

a1 = Ark('-','x0','x1',1);
a2 = Ark('-','x0','x1',1);
a3 = Ark('-','x1','x0',1);
a4 = Ark('-','x1','x0',1);

list = {a1 a2 a3 a4};
