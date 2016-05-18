function [ res ] = connIter(X,Y,A)
tabsrc=X;
tabdst=Y;
count=0;
p=1;
tabtmp=tabsrc;
i=0;
%nombre d'arcs
n=length(A);
res=0;
% verifier que la destination demandée est bien dans les destinations
for l=1:length(Y)
    for m=1:n
        if strcmp(Y{l},A{m}.dst)
            count=count+1;
        end
    end
end
if count == 0
    return
end
%recherche d'un chemin
while i<=n 
    for j=1:length(tabtmp)
        for i=1:n
            if strcmp(tabtmp{j},A{i}.src)
                for k=1:length(tabdst)
                    if strcmp(A{i}.dst,tabdst(k))
                        res = res + 1;
                    else
                        tabtmp{end+1}={A{i}.dst};
                        p=p+1;
                    end
                end
            end
        end
    end
    i = i + 1;
res
end
