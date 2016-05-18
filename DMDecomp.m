function [ listV ] = DMDecomp( tabNoeud )
%%Fonction qui fait une DM decomposition

     %% Algorithme de la propri�t�
    % Trouver U
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
    
    % Trouver V
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
    
    
    %tab = le tableau de tous les arcs
    %U = ensemble des V+
    %V = ensemble des V-
    totArc = tabNoeud;   %Liste de tous les arcs
    cmpTmp = 0; %Compteur temp qui permet de regarder si un sommet n'a qu'un arc adjacent
    p = 1;      %Compteur pour VarTmp
    varTmp(p) = Ark('-','0','0',0);
    
    %% Calcul d'un couplage complet epsilonM
    %Pour U : 
    for (i = 1:length(U))
       for (j = 1:length(totArc))

          if (strcmp(U{i},totArc{j}.src))
              cmpTmp = cmpTmp+1;
              varTmp(p) = Ark(totArc{j}.color,totArc{j}.src,totArc{j}.dst,totArc{j}.oriented);
          end
       end
       if (cmpTmp == 1)
          %listCC = varTmp(p)
          p = p+1;
       end
       cmpTmp = 0;
    end
   %Pour V : 
    for (i = 1:length(V))
       for (j = 1: length(totArc))
          if (strcmp(V{i},totArc{j}.dst))
              cmpTmp = cmpTmp+1;
              varTmp(p) = Ark(totArc{j}.color,totArc{j}.src,totArc{j}.dst,totArc{j}.oriented);
          end
       end
       if (cmpTmp == 1)
          p = p+1;
       end
       cmpTmp = 0;
    end
    for (n = 1:length(varTmp)-1)
        listCC(n) = varTmp(n);
        listCC(n);
    end
    
    
    %% Calcul de S0+ = S0 
    S0 = {};
    o=1;
    compteur =0;
    for (j = 1:length(U))
        for (i = 1:length(listCC))
           if (~strcmp(U{j}, listCC(i).src))
               compteur = compteur + 1;
           end
        end

        if (compteur == length(listCC))
           S0{o} = U{j};
           o = o+1;
        end
        compteur = 0;
    end
    S0 = unique(S0);
    S0
    
    
    %% Calcul de S0- = S1
    
    S1 = {};
    o=1;
    compteur =0;
    for (j = 1:length(V))
        for (i = 1:length(listCC))
           if (~strcmp(V{j}, listCC(i).dst))
               compteur = compteur + 1;
           end
        end

        if (compteur == length(listCC))
           S1{o} = V{j};
           o = o+1;
        end
        compteur = 0;
    end
    S1 = unique(S1);
    S1
    
    %% Calcul de Vinfp
    
    Vinfp = {};
    for (i = 1:length(U))
       for (j = 1:length(S1))
           
           end
    end
    
    
    
    
    
    
    
end

