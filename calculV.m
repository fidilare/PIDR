function [ V ] = calculV( tabNoeud )
%% Permet de calculer V-
V = {};
    for ( i = 1:length(tabNoeud))
        if (strfind(tabNoeud{i}.dst,'-') ~= 0)
            if (length(V) == 0)
                V{1} = tabNoeud{i}.dst;
            else
                V{length(V)+1} = tabNoeud{i}.dst;
            end
        end
    end
    V = unique(V);
end

