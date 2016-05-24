function [ res ] = uniqueArc( BM )
%Permet de supprimer les arcs doublons 
    res = {BM{1}};
    cmpt = 0;
    for (i = 2:length(BM))
        for (j = 1:length(res))
            if (~isequal(BM{i},res{j}))
                cmpt = cmpt + 1;
            end
        end
        if (cmpt == length(res))
            res{end +1} = BM{i};
        end
        cmpt = 0;
    end

end

