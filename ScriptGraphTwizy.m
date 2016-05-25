%% Création du Graph correspondant à la Twizy

a1 = Ark('-','V','D',1);        %Liaison Volant-Direction
a2 = Ark('-','D','R2',1);       %Liaison Direction-Roue2
a3 = Ark('-','D','R3',1);       %Liaison Direction-Roue3
a4 = Ark('-','F','R2',1);       %Liaison pédale de Frein-Roue2
a5 = Ark('-','F','R3',1);       %Liaison pédale de Frein-Roue3
a6 = Ark('-','A','R1',1);       %Liaison Pédale Accélération-Roue1
a7 = Ark('-','A','R2',1);       %Liaison Pédale Accélération-Roue2
a8 = Ark('-','A','R3',1);       %Liaison Pédale Accélération-Roue3
a9 = Ark('-','A','R4',1);       %Laision Pédale Accélération-Roue4
%a10 = Ark('-','R4','R1',0);     %Liaison Entre les deux roues arrières
    
list = {a1 a2 a3 a4 a5 a6 a7 a8 a9};
Alist = {a6 a7 a8 a9};