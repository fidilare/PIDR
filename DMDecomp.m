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
    
    %On enlève les + et les -
    for (i = 1:length(totArc))
        totArc{i} = Ark(totArc{i}.color,totArc{i}.src(1:end-1),totArc{i}.dst(1:end-1),totArc{i}.oriented);
    end   
    
    for (i = 1: length(V))
        V{i} = V{i}(1:end-1);
    end
    for (i = 1: length(U))
        U{i} = U{i}(1:end-1);
    end

    BM = {totArc{5}}; %Liste tmp des sommets on init avec le première arc
    cmpt=0;
    for (i = 1:length(totArc))
        for (j = 1:length(BM))
            if (~strcmp(totArc{i}.dst,BM{j}.src) && ~strcmp(totArc{i}.dst,BM{j}.dst) && ~strcmp(totArc{i}.src,BM{j}.src) && ~strcmp(totArc{i}.src,BM{j}.dst))
                cmpt=cmpt+1;
            end
        end
        if (cmpt==length(BM))
            BM{end+1} = totArc{i};
        end
        cmpt=0;
    end
    
    for (i = 1:length(BM))
        BM{i}
    end
    
    %% Calcul de S0+ = S0
    S0 = {''};
    p=1;
    compt = 0;
    for (j = 1:length(totArc))
        for (i = 1:length(BM))
           if (~strcmp(BM{i}.src,totArc{j}.src))
               compt = compt+1;
           end
        end
        
        if (compt == length(BM))
           S0{p} = totArc{j}.src; 
           p=p+1;
        end
        compt =0;
    end
    S0 = unique(S0)
    
   %% Calcul de S0- = S1
    S1 = {''};
    p=1;
    compt = 0;
    for (j = 1:length(totArc))
        for (i = 1:length(BM))
           if (~strcmp(BM{i}.dst,totArc{j}.dst))
               compt = compt+1;
           end
        end
        
        if (compt == length(BM))
           S1{p} = totArc{j}.dst; 
           p=p+1;
        end
        compt =0;
    end
    S1 = unique(S1)
    
    %% Calcul de V0+ = V0
    
    V0 = S0;
    for (i = 1:length(U))
       for (j = 1:length(S0))
           for (k = 1:length(totArc))
               for (l = 1:length(BM))
                    if (isequal(Ark('-',S0{j},U{i},1),totArc{k}) && isequal(Ark('-',U{i},S0{j},1),BM{l}))
                        V0{end+1}=U{j};
                    end
               end
           end
       end
    end
    
    
    V0 = unique(V0)
    
    
    
    %% Calcul de V0- = V1
    V1 = {};
    for (i = 1:length(V))
       for (j = 1:length(S0))
           for (k = 1:length(totArc))
               for (l = 1:length(BM))
                    if (isequal(Ark('-',S0{j},V{i},1),totArc{k}) && isequal(Ark('-',V{i},S0{j},1),BM{l}))
                        BM{l};
                        V1{end+1}=V{j};
                    end
               end
           end
       end
    end
    
    
    V1 = unique(V)
    
    %% Union de V0+ et V0-
    V0u = {};
    for (i = 1:length(V0))
        for (j = 1:length(V1))
            for (k = 1:length(totArc))
                if (strcmp(V0{i},totArc{k}.src) && strcmp(V1{j},totArc{k}.dst))
                    V0u{end+1} = Ark(totArc{k}.color,totArc{k}.src,totArc{k}.dst,totArc{k}.oriented);
                end
            end
        end
    end
    V0u
    
    
    %%Calcul de Vinf+ = Vinf
    
    Vinf = S1;
    for (i = 1:length(U))
       for (j = 1:length(BM))
           for (k = 1:length(S1))
               if (strcmp(U{i},BM{j}.src) && strcmp(S1{k},U{i}))
                    Vinf{end+1} = U{i};
               end
           end
       end
    end
    
    Vinf = unique(Vinf)
        
    %% Calcul de Vinf- = Vinf1
    
    Vinf1 = S1;
    for (i = 1:length(V))
       for (j = 1:length(BM))
           for (k = 1:length(S1))
               if (strcmp(V{i},BM{j}.src) && strcmp(S1{k},V{i}))
                    Vinf1{end+1} = V{i};
               end
           end
       end
    end
    
    Vinf1 = unique(Vinf1)
    
    %% Calcul Vinfu = Vinf U Vinf1
    
    Vinfu = {};
    for (i = 1:length(Vinf))
        for (j = 1:length(Vinf1))
            for (k = 1:length(totArc))
                if (strcmp(Vinf{i},totArc{k}.src) && strcmp(Vinf1{j},totArc{k}.dst))
                    Vinfu{end+1} = Ark(totArc{k}.color,totArc{k}.src,totArc{k}.dst,totArc{k}.oriented);
                end
            end
        end
    end
    Vinfu
    
    
    
    
end

