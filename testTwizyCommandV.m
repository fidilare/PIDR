function [printBool] = testTwizyCommandV(list)
list = graphToBipartite(list);          %On travail avec des graphs Bi partie
Vlist = {};
sV = sommetAccessible('V+',list);
for (i = 1:length(sV))
   Vlist{end+1} = Ark('-','V+',sV{i},1); %Alist = tous les sommets accessibles depuis A
end
for (i = 1:length(sV))
    sTmp= sommetAccessible(strcat(sV{i}(1:end-1),'+'),list);
    for (j = 1:length(sTmp))
        Vlist{end+1} = Ark('-',strcat(sV{i}(1:end-1),'+'),sTmp{j},1);
    end
end
Vlist{:};
V = calculV(Vlist);

res = couplageCompletCommand('V+',Vlist,V);
printBool = '';
for (i = 1:length(res))
   printBool = strcat(printBool,printArc(res{i}),'ET');
end

printBool = printBool(1:end-2);

