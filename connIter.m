function [ res ] = connIter(X,Y,A)
%% Fonction qui retourne si tous les �l�ments de X sont connect� � au moins un �l�ment de Y dans A

    res = {};
    
    for (i = 1:length(X))
        for (j = 1:length(Y))
            res{i} = connIter2(X{i},Y{j},A);
            if (res{i} ==1)
                break
            end
        end
    end


end
