function [ BM ] = couplageCompletCommand( entree,totArc,V )
%Fonction qui calcule un couplage de totArc
        BM = {}; %Liste tmp des arcs du couplage complet on init avec le première arc
        cmpt=0;
        sA = sommetAccessible(entree,totArc);
        

        for (i = 1:length(V))
           for (j=1:length(sA))
              if (strcmp(V{i},sA{j}))
                 	BM{end+1} = Ark('-',entree,V{i},1);
                    V{i} = '0';
              end
           end
        end

        for (i = 1:length(V))
            if (strcmp(V{i},'0'))
            	cmpt = cmpt +1;
            end
        end
        if (cmpt == length(V))
           return 
        end
        
        BMtmp = {};
        %On regarde tous les sommets accessible par les sommets sA
        for (i = 1:length(sA))
            sTmp= sommetAccessible(strcat(sA{i}(1:end-1),'+'),totArc);
            for (j = 1:length(sTmp))
                for (k = 1:length(sA))
                    if (~strcmp(sTmp{j},sA{k}))
                        BMtmp = couplageCompletCommand(strcat(sA{i}(1:end-1),'+'),totArc,V);
                        break
                    end
                end
            end
        end
        for (i = 1:length(BMtmp))
            BM{end+1} = BMtmp{i};
        end
end

