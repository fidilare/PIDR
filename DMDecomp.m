function [ listV ] = DMDecomp( tabNoeud )
%%Fonction qui fait une DM decomposition

     %% Algorithme de la propriété
    % Trouver U
    U = calculU(tabNoeud);
    % Trouver V
    V =calculV(tabNoeud); 
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
    BM = {};
    for (i = 1:length(totArc)-1)
        if (length(BM) < length(couplageC(totArc,i)))
            BM = couplageC(totArc,i+1);
        end
    end
    uniqueArc(BM);    
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
    S0 = unique(S0);
    
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
    S1 = unique(S1);
    
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
    V0= unique(V0);
    
    cmpt = 0;
    V0tmp = {};
    for (i = 1:length(U))
       for (j = 1 : length(V0))
          if (~strcmp(U{i},V0{j}))
               cmpt = cmpt +1;
          end
       end
       if (cmpt == length(V0))
           V0tmp{end +1} = U{i};
       end
       cmpt = 0;
    end
    
    V0 = V0tmp;
    
    
    
    %% Calcul de V0- = V1
    V1 = {};
    connIter1(V, S1,totArc);
    for (i = 1:length(V))
       for (j = 1:length(S0))
           for (k = 1:length(totArc))
               for (l = 1:length(BM))
                    if (isequal(Ark('-',S0{j},V{i},1),totArc{k}) && isequal(Ark('-',V{i},S0{j},1),BM{l}))
                        V1{end+1}=V{j};
                    end
               end
           end
       end
    end    
    V1 = unique(V);
    
    cmpt = 0;
    V1tmp = {};
    for (i = 1:length(V))
       for (j = 1 : length(V1))
          if (~strcmp(V{i},V1{j}))
               cmpt = cmpt +1;
          end
       end
       if (cmpt == length(V1))
           V1tmp{end +1} = V{i};
       end
       cmpt = 0;
    end
    
    V1 = V1tmp;
    
    
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
    V0u;
    
    
    %% Calcul de Vinf+ = Vinf
    
    Vinf = {};
    resVinf = connIter1(U,S1,totArc);
    for (i = 1:length(resVinf))
       if (resVinf(i) == 1)
          Vinf{end +1} = U{i}; 
       end
    end
    Vinf = unique(Vinf);
    
    cmpt = 0;
    Vinftmp = {};
    for (i = 1:length(U))
       for (j = 1 : length(Vinf))
          if (~strcmp(U{i},Vinf{j}))
               cmpt = cmpt +1;
          end
       end
       if (cmpt == length(Vinf))
           Vinftmp{end +1} = U{i};
       end
       cmpt = 0;
    end
    
    Vinf = Vinftmp;
        
    %% Calcul de Vinf- = Vinf1
    
    Vinf1 = S1;
    resVinf1 = connIter1(V,S1,totArc);
    for (i = 1:length(resVinf1))
       if (resVinf1(i) == 1)
          Vinf1{end +1} = U{i}; 
       end
    end
    Vinf1 = unique(Vinf1);
    % on inverse pour faire correspondre à BM(V+,V-,Ebarre)
    cmpt = 0;
    Vinftmp1 = {};
    for (i = 1:length(V))
       for (j = 1 : length(Vinf1))
          if (~strcmp(V{i},Vinf1{j}))
               cmpt = cmpt +1;
          end
       end
       if (cmpt == length(Vinf1))
           Vinftmp1{end +1} = V{i};
       end
       cmpt = 0;
    end
    
    Vinf1 = Vinftmp1;
    %% Calcul Vinfu = Vinf U Vinf1
    
    Vinfu = {};
    for (i = 1:length(Vinf))
        for (j = 1:length(Vinf1))
            for (k = 1:length(totArc))
                if (strcmp(Vinf{i},totArc{k}.src) && strcmp(Vinf1{j},totArc{k}.dst))
                    Vinfu{end+1} = Ark(totArc{k}.color,Vinf{i},Vinf1{j},totArc{k}.oriented);
                end
            end
        end
    end
    Vinfu{:};
    % On ajoute BM pour avoir le Vinf total

    Vinftotal = Vinfu;
    cmpt = 0;
    for (j = 1:length(BM))
        for (i = 1:length(Vinfu))
            if (isequal(BM{j},Vinfu{i}))
                cmpt = cmpt+1;
            end            
        end
        if (cmpt == 0)
            Vinftotal{end+1} = BM{j};
        end
        cmpt=0;
    end
  
    for (i = 1: length(Vinftotal))
            Vinftotal{i}.src(end+1) = '+';
            Vinftotal{i}.dst(end+1) = '-';
    end
    
    %% Calcul des composantes connexes et extractions des Vi
    cmpt = 0;
    Vip = {};
    for (i = 1:length(U))
        for (j = 1:length(Vinf))
            if (strcmp(U{i},Vinf{j}))
                cmpt = cmpt+1;
            end
        end
        if (cmpt == 0)
            Vip{end+1} = U{i};
        end
        cmpt = 0;
    end
    Vip;
   
    Vim = {};
    for (i = 1:length(V))
        for (j = 1:length(Vinf1))
            if (strcmp(V{i},Vinf1{j}))
                cmpt = cmpt+1;
            end
        end
        if (cmpt == 0)
            Vim{end+1} = V{i};
        end
        cmpt = 0;
    end
    Vim;
    
    %Les Vi maintenant
    
    Vi = {};
    for (i = 1:length(Vip))
       Vi{end +1} = Ark('-',Vip{i},Vim{i},1);
       Vi{end}.src(end+1) = '+';
       Vi{end}.dst(end+1) = '-';
    end
        
     Vi{:};
    listV = {V0u Vinftotal Vi{:}};
end