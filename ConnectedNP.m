function out=ConnectedNP(G,servers)
% ConnectedNP(G,servers) - Computes the number of connected node pairs when
%             server nodes are eliminated (returns -1 for invalid input data)
%
% G:       graph of the network
% servers: a row array of server nodes
    
    nNodes= numnodes(G);
    if length(servers)>=1
        if (max(servers)>nNodes || min(servers)<1 || length(unique(servers))<length(servers))
            out= -1;
            return
        end
    end
    clients= setdiff(1:nNodes,servers);
    Gr= subgraph(G,clients);
    dist= distances(Gr);
    out= (sum(dist(:)<Inf) - numnodes(Gr))/2;
end