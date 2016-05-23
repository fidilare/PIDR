function [res] = connIter2(X,Y,list)
destination = Y;
parcouru = {};
resteaparcourir = {X};
count = 0;
while (length(resteaparcourir) ~=0 && count < length(list)*10)
    x = resteaparcourir{1};
    parcouru = unique(parcouru);
    ListTmp = sommetAccessible(x,list);
    for s=1:length(ListTmp)
        if strcmp(ListTmp(s),Y)
            res = 1;
            return
        else 
            if(length(parcouru) ~=0)
                for sommet=1:length(parcouru)
                    for j=1:length(resteaparcourir)
                        if (~strcmp(ListTmp(s),parcouru{sommet}) && ~strcmp(ListTmp(s),resteaparcourir{j}))
                            resteaparcourir{end+1} = ListTmp{s};
                            count = count +1;
                        end
                    end
                end
            else
                for j=1:length(resteaparcourir)
                    if (~strcmp(ListTmp(s),resteaparcourir{j}))
                        resteaparcourir{end+1} = ListTmp{s};
                        count = count +1;
                    end
                end
            end
        end
    end
    resteaparcourir = unique(resteaparcourir,'stable');
    resteaparcourir(1) = [];
    parcouru{end+1} = x;
end
res = 0; 
                