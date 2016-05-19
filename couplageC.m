function [ BM ] = couplageC( totArc,iter )
%Fonction qui calcule un couplage de totArc
    BM = {totArc{iter}}; %Liste tmp des arcs du couplage complet on init avec le première arc
        cmpt=0;
        totArc{:};
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
end

