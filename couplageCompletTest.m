function [ res ] = couplageCompletTest( A )
    n = size(A);
    tabNoeud = {A{1,2}};
    length(tabNoeud);
    compt = 0;
    
    %% Recupère tout les noeuds du graph
    for i = 1:n
        for j = 1:length(tabNoeud)
            if (~strcmp(A{i,2},tabNoeud{j}))
               compt = compt +1;
            end
        end
        if (compt == length(tabNoeud))
            tabNoeud{length(tabNoeud)+1} = A{i,2};
        end
        compt =0;
    end
    compt = 0;
    for i = 1:n
        for j = 1:length(tabNoeud)
            if (~strcmp(A{i,3},tabNoeud{j}))
               compt = compt +1;
            end
        end
        if (compt == length(tabNoeud))
            tabNoeud{length(tabNoeud)+1} = A{i,3};
        end
        compt =0;
    end
    %% Algorithme de la propriété
    % Trouver U
    U = {};
    for ( i = 1:length(tabNoeud))
        if (strfind(tabNoeud{i},'+') ~= 0)
            if (length(U) == 0)
                U{1} = tabNoeud{i};
            else
                U{length(U)+1} = tabNoeud{i};
            end
        end
    end
    
    % Trouver V
    V = {};
    for ( i = 1:length(tabNoeud))
        if (strfind(tabNoeud{i},'-') ~= 0)
            if (length(V) == 0)
                V{1} = tabNoeud{i};
            else
                V{length(V)+1} = tabNoeud{i};
            end
        end
    end
 %% Algorithme du couplage complet
    X = {};
    nb = 0;
    for (l = 1:length(U))
        X{l} = U{l};
        for (i = 1:length(A))
            for (j = 1:length(X))
                for (k = 1:length(V))
                    if (strcmp(A{i,2},X{j}) && strcmp(A{i,3},V{k}))
                        nb = nb+1;
                    end
                end
            end
        end
        if (nb < length(V))
            res = 0;
            break;
        end
    end
    res = 1;
end

