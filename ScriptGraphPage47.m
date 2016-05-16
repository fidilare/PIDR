a1 = Ark('a1','S','N2',1);
a2 = Ark('a2','S','N3',1);
a3 = Ark('a3','N3','N4',1);
a4 = Ark('a4','N3','N4',1);
a5 = Ark('a5','N3','N2',1);
a6 = Ark('a6','N2','N5',1);
a7 = Ark('a7','N3','N5',1);
a8 = Ark('a8','N2','N1',1);
a9 = Ark('a9','N1','N2',1);
a10 = Ark('a10','N4','T',1);
a11 = Ark('a11','N5','T',1);
a12 = Ark('a12','N5','T',1);

list = {a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12};
tab = tabConstruct(list)