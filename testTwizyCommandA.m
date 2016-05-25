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

    res = DMDecomp('A',list);
    printBool = '';
    resVi = {};
    for (i = 3:length(res))
       resVi{end+1} = res{i}; 
    end
    
    printTmp = {};
    for (i = 1:2)
        n = length(res{i});
        for (j = 1:n)
            printTmp{end+1} = res{i}{j};
        end
    end
    
    for (i = 1:2)
        n=length(res{i});
        for (j = 1:n)
            for(k=1:length(resVi))
                if (strcmp(res{i}{j}.dst(1:end-1),resVi{k}.dst(1:end-1)))
                    printBool = strcat(printBool,'[',printArc(res{i}{j}),'OU',printArc(resVi{k}),']','ET');
                    res{i}{j};
                    printTmp = supprElement(printTmp,res{i}{j})
                end
            end
        end
    end
        printTmp
        for (i = 1:length(printTmp))
            printBool = strcat(printBool,printArc(printTmp{i}),'ET'); 
        end
    printBool = printBool(1:end-2);
    

    Alist;
end









