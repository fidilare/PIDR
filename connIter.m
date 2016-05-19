function [ res ] = connIter(X,Y,A)
%% La fonction retourne un 1 si la src i de X est connecté à au moins 1 éléments de Y, 0 sinon
    res = zeros(1,length(X));
    tabsrc=X;
    count=0;
    p=1;
    tabtmp=tabsrc;
    i=0;
    %nombre d'arcs
    n=length(A);
    
     count=0;
%     %% verifier que la source demandée est bien dans source d'un arc
%     for l=1:length(X)
%         for m=1:n
%             if strcmp(X{l},A{m}.src)
%                 count=count+1;
%             end
%         end
%         
%         if count == 0
%             disp('Attention, une des sources demandées n est pas source d un arc')
%             res = -1;
%             return
%         else
%             count=0;
%         end
%     end
%     
%     %% verifier que la destination demandée est bien dans les destinations
%     for l=1:length(Y)
%         for m=1:n
%             if strcmp(Y{l},A{m}.dst)
%                 count=count+1;
%             end
%         end
%         if count == 0
%              disp('Attention, une des Destinations demandées n est pas destinations d un arc')
%              res = -1;
%              return
%         else
%             count = 0;
%         end
%     end
   

    p = 1;
    %% recherche d'un chemin
    lim =0;
    while lim<=n 
        for j=1:length(tabtmp)
            for i=1:n
                if (strcmp(tabtmp{j},A{i}.src))
                    for k=1:length(Y)
                        if strcmp(A{i}.dst,Y{k})
                            res(p) = 1;
                        end
                    end
                end
            end
            if (p < length(X))
                if (res(p) == 0)
                       tabtmp{end+1}=A{i}.dst;
                       tabtmp = unique(tabtmp);
                       p = p+1;
                else
                       p = p+1;
                end
            else
                break
            end
        end
        lim = lim +1;
    end
    
end 
