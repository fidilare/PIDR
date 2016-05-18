function [ res ] = connIter(X,Y,A)
%% La fonction retourne un 1 si la src i de X est connecté à au moins 1 éléments de Y, 0 sinon
    res = zeros(1,length(X));
    tabsrc=X;
    tabdst=Y;
    count=0;
    p=1;
    tabtmp=tabsrc;
    i=0;
    %nombre d'arcs
    n=length(A);
    res=0;
    
     count=0;
    %% verifier que la source demandée est bien dans source d'un arc
    for l=1:length(X)
        for m=1:n
            if strcmp(X{l},A{m}.src)
                count=count+1;
            end
        end
        
        if count == 0
            disp('Attention, une des sources demandées n est pas source d un arc')
            res = -1;
            return
        else
            count=0;
        end
    end
    
    %% verifier que la destination demandée est bien dans les destinations
    for l=1:length(Y)
        for m=1:n
            if strcmp(Y{l},A{m}.dst)
                count=count+1;
            end
        end
        if count == 0
             disp('Attention, une des Destinations demandées n est pas destinations d un arc')
             res = -1;
             return
        else
            count = 0;
        end
    end
   

    p = 1;
    %% recherche d'un chemin
    while i<=n 
        for j=1:length(tabtmp)
            for i=1:n
                if strcmp(tabtmp{j},A{i}.src)
                    for k=1:length(tabdst)
                        if strcmp(A{i}.dst,tabdst(k))
                            res(p) = 1;
                        else
                            tabtmp{j}={A{i}.dst};
                        end
                    end
                end
            end
          p = p+1;
        end
        i = i + 1;
    end
    
    
end 
