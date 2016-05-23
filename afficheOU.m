function [ res ] = afficheOU( a,b )
%% Fonction qui affiche un OU entre deux arcs
    res = strcat(printArc(a),'U', printArc(b));
end

