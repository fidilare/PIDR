function [ printBool ] = testTwizyCommandF( list )
    list = graphToBipartite(list);          %On travail avec des graphs Bi partie
    Flist = {};
    sF = sommetAccessible('F+',list);
    for (i = 1:length(sF))
       Flist{end+1} = Ark('-','F+',sF{i},1); %Alist = tous les sommets accessibles depuis A
    end
    for (i = 1:length(sF))
        sTmp= sommetAccessible(strcat(sF{i}(1:end-1),'+'),list);
        for (j = 1:length(sTmp))
            Flist{end+1} = Ark('-',strcat(sF{i}(1:end-1),'+'),sTmp{j},1);
        end
    end
    Flist{:};
    V = calculV(Flist);

    res = couplageCompletCommand('F+',Flist,V);
    printBool = '';
    for (i = 1:length(res))
       printBool = strcat(printBool,printArc(res{i}),'ET');
    end

    printBool = printBool(1:end-2);
end

