function [ res ] = supprArc( E, el )
%%Fonction qui supprime tous les arcs de E, si
    res = E;
    
    if (length(E) == 1 && (strcmp(el,E{1}.src) || strcmp(el,E{1}.dst)))
        res = {};
        return
    end
    for (i = 1:length(E))
        if (strcmp(el.src,E{i}.src) || strcmp(el.dst,E{i}.dst) || strcmp(el.src,E{i}.dst) ||strcmp(el.dst,E{i}.src))
            
            if (length(res) == 1)
                res = {};
                return
            end
            res(i) = [];
        end
    end
end

