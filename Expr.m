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
            for (k = 1:length(a))
                res = strcat(res,'U [',printArc(a{k}));
            end
                res = strcat(res,']');
            res = strcat(res,'&  [',Expr(U,E),']');
        else
            U = {};
            for (k = 1:length(a))
                res = strcat(res,printArc(a{k}));
            end
            res = strcat(res,']');
        end
    end
    
%     for (i = 1:length(U))
%          a = chercheArc(E,U{i});
%             if (length(U) == 1)
%                 res = strcat('U',printArc(a{1:end}));
%             end
%     
%          if (~isempty(a))
%              for (k = 1:length(a))
%                  E = supprArc(E,a{k})
%              end
%                  res = strcat(res,printArc(a{1}),Expr(supprElement(U,U{i}),E))
%          end
%     end
end

