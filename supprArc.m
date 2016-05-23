function [ res ] = supprArc( E, el )
%%Fonction qui supprime un arc de E, à partir d'une src ou d'une dst
    res = E;

    
    if (length(E) == 1 && (strcmp(el,E{1}.src) || strcmp(el,E{1}.dst)))
        res = {};
        return
    end
    for (i = 1:length(E))
        if (strcmp(el.src,E{i}.src) || strcmp(el.dst,E{i}.dst))
            i
            length(E)
            length(res)
            res(i) = [];
        end
    end
end

