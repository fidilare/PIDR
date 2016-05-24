function [ res ] = MCP( B )
    %d'après la proposition 5 page 96: MC(B) <=> Expr(V+,E*) = 'true'
	%Avec E* étant l'ensemble des arcs intra-classes après DM Decomposition
    res = '';
    DMBtmp = {};
    %Passage de B en graph BiPartie
    B = graphToBipartite(B);
    %Calcul V+ et V-
    U = calculU(B);
    V = calculV(B);
    DMB = DMDecomp(B)
    DMB{2}{:}
    DMB{4}
    for (j = 1:2)                   %% On récupère V0u et Vinftot
        for (i = 1:length(DMB{j}))
            DMBtmp{end+1} = DMB{j}{i};
        end
    end
    
    for (j = 3:length(DMB))         %% On récupère les Vi
        DMBtmp{end+1} = DMB{j};
    end
    res = Expr(V,DMBtmp);

end

