function [res] = connIter2(X,Y,list)
destination = Y;
parcouru = {};
resteaparcourir = {};
while resteaparcourir ~= isempty(resteaparcourir)
    x = resteaparcourir{1};
    ListTmp = sommetAccessible(x,list);
    for s=1:length(ListTmp)
        if strcmp(ListTmp(s),Y)
            res = 1;
            return
        else 
            for sommet=1:length(parcouru)
                for j=1:length(resteaparcourir)
                if (~strcmp(ListTmp(s),parcouru{sommet} &&
                    ~strcmp(ListTmp(s),resteaparcourir{j})
                    resteaparcourir{end+1};
                end
                end
            end
        end
    end
    resteaparcourir(1) = [];
    parcouru{end+1};
end
res = 0; 
                