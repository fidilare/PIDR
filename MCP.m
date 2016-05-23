function [ res ] = MCP( B )
    %d'après la proposition 5 page 96: MC(B) <=> Expr(V+,E*) = 'true'
	%Avec E* étant l'ensemble des arcs intra-classes après DM Decomposition
    res = '';
    DMBtmp = {}
    %Calcul V+ et V-
    U = calculU(B);
    V = calculV(B);
    DMB = DMDecomp(B);
    for (j = 1:length(DMB))
        for (i = 1:length(DMB{j}))
            DMBtmp{end+1} = DMB{j}{i};
        end
    end
    res = Expr(U,V,DMBtmp);

end

