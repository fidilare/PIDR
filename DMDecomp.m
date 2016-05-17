function [ listV ] = DMDecomp( tabNoeud )
%%Fonction qui fait une DM decomposition
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
    %tab = le tableau de tous les arcs
    %U = ensemble des V+
    %V = ensemble des V-
    totArc = tabNoeud;   %Liste de tous les arcs
    cmpTmp = 0; %Compteur temp qui permet de regarder si un sommet n'a qu'un arc adjacent
    listCC ={}; %Liste d'arc qui est dans le couplage complet qu'on a trouvé
    varTmp = {};%Variable temporelle qui permet de sauvegarder l'arc à mettre dans listCC
    %Calcul d'un couplage complet
    for (i = 1:length(U))
       for (j = 1: size(totArc,1))
          if (strcmp(U{i},totArc{j,2}))
              cmpTmp = cmpTmp+1;
              for (l = 1:4)   
                    varTmp{j,l} = totArc{j,l};
              end
              saveIndice = j;   %Permet de sauver l'indice pour l'enlever de la liste
          end
       end
       k=1;
       if (cmpTmp == 1)
           listCC{k} = varTmp;
           for(j=1:4)
                totArc{saveIndice,j} = {}
           end
           k=k+1;
       end
       varTmp={};
       cmpTmp = 0;
    end

    listV = listCC;



end

