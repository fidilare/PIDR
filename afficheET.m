function [ res ] = afficheET( a,b )
%%Fonction qui affiche le ET entre deux arcs
    res = strcat(printArc(a),'&', printArc(b));
end

