% SA - HC definition 1
function [result result_nodes] = SA_HC_1(G,n,nodes,resulta)
N = numnodes(G);
result_nodes = nodes;
result = resulta;
no_sols = 1;
cont = true;
    while cont
        value = inf;
        aux = setdiff(1:N,result_nodes);
        for a = result_nodes
            for b = aux
                nei = [setdiff(result_nodes,a) b];
                nei_result = ConnectedNP(G,nei);
                if nei_result < value
                    value = nei_result;
                    best_nei = nei;
                end   
            end
        end
        if value < result
            result_nodes = best_nei;
            result = value;
        else
            cont = false;
        end
        no_sols = no_sols + 1;
    end
end