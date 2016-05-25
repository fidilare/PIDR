function [ BG ] = graphToBipartite( G )
    %%Fonction qui transforme un graph en graph bi Partie
    BG = {};
    if (strcmp(G{1}.src(end),'+'))
       disp('Entrée déjà un graph bipartie')
       return
    end
    
    for (i = 1:length(G))
        if (G{i}.oriented == 0)
           BG{end+1} = Ark('-',strcat(G{i}.dst,'+'),strcat(G{i}.src,'-'),1);
        end
        BG{end+1} = Ark('-',strcat(G{i}.src,'+'),strcat(G{i}.dst,'-'),1);        
    end
    
    
    
    
    
end

