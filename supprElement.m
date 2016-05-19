function [ Ures ] = supprElement( U,e )
    %%Supprime l'element e de U
    Ures = U;
    if (isequal(U, {}))
        return
    end
    for (i = 1:length(U))
       if (isequal(U{i},e))
           Ures(i) = [];
       end
    end
    if (length(U) == 1)
        Ures={};
    end
    
end

