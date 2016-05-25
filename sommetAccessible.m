function [ listDst ] = sommetAccessible( src, A )
    %%Fonction qui retourne la liste listDst des destination accessible par
    %%src
    
    listDst = {};
    for (i = 1:length(A))
        if (strcmp(src,A{i}.src))
            listDst{end+1} = A{i}.dst;
        end
    end
    listDst = unique(listDst);
end

