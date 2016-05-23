function [ arc ] = chercheArc( E,el )
%retourne les arcs où il y a l'élément el en src ou dst
    arc = {};
    for (i = 1:length(E))
            if (strcmp(E{i}.src,el) || strcmp(E{i}.dst,el))
                arc{end+1}= E{i};
            end
    end
end

