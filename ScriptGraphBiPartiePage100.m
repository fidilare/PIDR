%%Script test for graphBiPartiePage100

a1 = Ark('-','x3+','y2,0-',1);
a2 = Ark('-','x1+','y1,0-',1);
a3 = Ark('-','x1+','x1,0-',1);
a4 = Ark('-','x1+','x2,1-',1);
a5 = Ark('-','x2+','x1,1-',1);
a6 = Ark('-','x2+','x4,0-',1);
a7 = Ark('-','x2+','x3,0-',1);
a8 = Ark('-','x2+','x2,0-',1);
a9 = Ark('-','x5+','x4,0-',1);
a10 = Ark('-','x5+','x5,0-',1);
a11 = Ark('-','x5+','y3,0-',1);
a12 = Ark('-','x4+','x5,0-',1);
a13 = Ark('-','x4+','x2,0-',1);


list = {a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13};
tab = tabConstruct(list)