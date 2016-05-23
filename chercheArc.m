function [ arc ] = chercheArc( E,el )
%retourne la position de a dans E, 0 sinon
    arc = {};
    for (i = 1:length(E))
            if (strcmp(E{i}.src,el) || strcmp(E{i}.dst,el))
                arc= E{i};
            end
    end
end

