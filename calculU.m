function [ U ] = calculU( tabNoeud )
%% Permet de récupérer V+ d'un graph bi parti
    U = {};
    for ( i = 1:length(tabNoeud))
        if (strfind(tabNoeud{i}.src,'+') ~= 0)
            if (length(U) == 0)
                U{1} = tabNoeud{i}.src;
            else
                U{length(U)+1} = tabNoeud{i}.src;
            end
        end
    end
    U = unique(U);

end

