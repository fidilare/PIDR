function [printBool] = testTwizyCommandA(list)
    listBi = graphToBipartite(list);          %On travail avec des graphs Bi partie
    Alist = {};
    sA = sommetAccessible('A+',listBi);
    for (i = 1:length(sA))
       Alist{end+1} = Ark('-','A+',sA{i},1); %Alist = tous les sommets accessibles depuis A
    end
    for (i = 1:length(sA))
        sTmp= sommetAccessible(strcat(sA{i}(1:end-1),'+'),listBi);
        for (j = 1:length(sTmp))
            Alist{end+1} = Ark('-',strcat(sA{i}(1:end-1),'+'),sTmp{j},1);
        end
    end
    Alist{:};
    V = calculV(Alist);

    res = couplageCompletCommand('A+',Alist,V);
    printBool = '';
    for (i = 1:length(res))
       printBool = strcat(printBool,printArc(res{i}),'ET');
    end

    printBool = printBool(1:end-2);
end









