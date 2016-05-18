function [ listV ] = DMDecomp( tabNoeud )
%%Fonction qui fait une DM decomposition

     %% Algorithme de la propriété
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
    
    %% Variables
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
              saveIndice(p) = j;
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
              saveIndice(p) = j;
          end
       end
       if (cmpTmp == 1)
           p = p+1;
       end
       cmpTmp = 0;
    end
    for (n = 1:length(varTmp)-1)
        listCC(n) = varTmp(n);
        listCC(n)
    end
    saveIndice = unique(saveIndice)
    tmpArk = totArc;

    for ( p = 1:length(saveIndice))
        tmpArk(p) = []; %tmpArk est la liste des arcs sans ceux qui font parti du CC 
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
    S0;
    
    
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
    S1;
    
    %Ajustement de listCC
    
    for (i = 1:length(S0))
       for (j = 1 : length(S1))
           for (k = 1:length(tmpArk))
                if (strcmp(S0{i},tmpArk{k}.src) && strcmp(S1{j},tmpArk{k}.dst))
                   listCC(end+1) = Ark(tmpArk{k}.color,tmpArk{k}.src,tmpArk{k}.dst,tmpArk{k}.oriented);
                   S0(i) = []
                   S1(j) = []
                end
                if (length(S0) == 0 || length(S1) == 0)
                   break 
                end
            end
       end
    end
    S0
    S1
    
    %% Calcul de V0+ = V0
    
    V0 = S0;
    for (i = 1:length(U))
       for (j = 1:length(tmpArk))
           if (strcmp(U{i},tmpArk{j}.src))
               for (k = 1:length(S0))
                   if (strcmp(S0{k},U{i}))
                       V0{end+1}     = U{i};
                   end
               end
           end
       end
    end
    
    V0 = unique(V0)
    
    
    
    %% Calcul de V0- = V1
    V1 = {};
    for (i = 1:length(V))
       for (j = 1:length(tmpArk))
           if (strcmp(V{i},tmpArk{j}.dst))
               for (k = 1:length(S1))
                   if (strcmp(S1{k},V{i}))
                       V1{end+1}     = V{i};
                   end
               end
           end
       end
    end
    
    V1 = unique(V1)
    
    %% Union de V0+ et V0-
    V0u = {};
    for (i = 1:length(V0))
        for (j = 1:length(V1))
            for (k = 1:length(tmpArk))
                if (strcmp(V0{i},tmpArk{k}.src) && strcmp(V1{j},tmpArk{k}.dst))
                    V0u{end+1} = Ark(tmpArk{k}.color,tmpArk{k}.src,tmpArk{k}.dst,tmpArk{k}.oriented);
                end
            end
        end
    end
    V0u{1}
end

