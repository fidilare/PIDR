function [ res ] = Expr( U, E )
  
    res = '';
    a = {};
    if (isempty(U) || isempty(E))
        disp('BLBLBL')
        return
    end
    U;
    a = chercheArc(E,U{1});
    if (~isempty(a))
        for (j = 1:length(a))
            E = supprArc(E,a{j});
        end
        if (length(U) ~= 1)
            U = U(2:end);
            res = strcat(res,printArc(a{1}));
            for (k = 2:length(a))
                    res = strcat(res,'OU [',printArc(a{k}));
            end
            res = strcat(res,'ET [',Expr(U,E),']');
        else
            U = {};
            for (k = 1:length(a))
                res = strcat(res,printArc(a{k}));
            end
                res = strcat(res,']');
        end
    end

end

