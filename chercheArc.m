function [ arc ] = chercheArc( E,el )
%retourne les arcs o� il y a l'�l�ment el en src ou dst
    arc = {};
    for (i = 1:length(E))
            if (strcmp(E{i}.src,el) || strcmp(E{i}.dst,el))
                arc{end+1}= E{i};
            end
    end
end

