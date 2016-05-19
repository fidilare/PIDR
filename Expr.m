function [ res ] = Expr( U, V, E )
  
    res = '';
    a = {};
    if (isempty(U) || isempty(E))
        return
    end

    
    for (i = 1:length(U))
         a = chercheArc(E,U{i});
         if (~isempty(a))
             U = supprElement(U,a.src)
             E = supprElement(E,a);
             res = strcat(res,'(',a.src,',',a.dst,')',Expr(U,V,E))
         end
    end
end

