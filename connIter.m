function [ res ] = connIter(X,Y,A)
%% La fonction retourne un 1 si la src i de X est connect� � au moins 1 �l�ments de Y, 0 sinon

    res = zeros(1,length(X));

    
    tabsrc=X;
    %nombre d'arcs
    n=length(A);
%     %% verifier que la source demand�e est bien dans source d'un arc
%     for l=1:length(X)
%         for m=1:n
%             if strcmp(X{l},A{m}.src)
%                 count=count+1;
%             end
%         end
%         
%         if count == 0
%             disp('Attention, une des sources demand�es n est pas source d un arc')
%             res = -1;
%             return
%         else
%             count=0;
%         end
%     end
%     
%     %% verifier que la destination demand�e est bien dans les destinations
%     for l=1:length(Y)
%         for m=1:n
%             if strcmp(Y{l},A{m}.dst)
%                 count=count+1;
%             end
%         end
%         if count == 0
%              disp('Attention, une des Destinations demand�es n est pas destinations d un arc')
%              res = -1;
%              return
%         else
%             count = 0;
%         end
%     end
   

    p = 1;
    lim = 0;
    %% recherche d'un chemin
    while (lim <= n && p <= length(X))
        for (i=1:length(X))
            for (k = 1:length(A))
                if (strcmp(A{k}.src,X{i}))
                    for (j=1:length(Y))
                        if (strcmp(A{k}.dst,Y{j}))
                            res(p) = 1;
                        else
                            X{i} = A{k}.dst;
                        end
                    end                   
                end
            end
            p = p+1;
        end
        lim = lim+1;
    end
end
