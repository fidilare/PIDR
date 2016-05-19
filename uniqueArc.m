function [ res ] = uniqueArc( BM )
%Permet de supprimer les arcs doublons 

for (i = 1:length(BM))
    for (j = 1:length(BM))
        if (isequal(BM{i},BM{j}))
            cmpt = 1;
        end
    end
    if (cmpt == 0)
        res{end +1} = BM{i};
    end
    cmpt = 0;
end

end

