a1 = Ark('u0','u2','x1',1);
a2 = Ark('u0','x1','x1',1);
a3 = Ark('u2','x1','x1',1);
a4 = Ark('u2','x1','x2',1);
a5 = Ark('u0','x2','y1',1);
a6 = Ark('u0','u2','x6',1);
a7 = Ark('u2','x6','x2',1);
a8 = Ark('u1','x2','x3',1);
a9 = Ark('u2','x2','x3',1);
a10 = Ark('u0','x3','y2',1);
a11 = Ark('u0','x6','x5',1);
a12 = Ark('u1','x5','x4',1);
a13 = Ark('u1','x4','x5',1);
a14 = Ark('u2','x4','x3',1);
a15 = Ark('u0','x7','x5',1);
a16 = Ark('u1','x5','x8',1);
a17 = Ark('u2','x5','x8',1);
a18 = Ark('u1','x7','x8',1);
a19 = Ark('u1','x8','x4',1);
a20 = Ark('u0','x8','y3',1);
a21 = Ark('u0','u1','x8',1);
a22 = Ark('u0','u1','y3',1);

list = {a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22};
tab = tabConstruct(list)