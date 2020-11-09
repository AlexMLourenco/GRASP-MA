function [result_best result_nodes_best no_sols] = GRASP(G,n,time,r)
    t1 = tic;
    result_nodes = GreedyRandomized(G,n,r);
    result = ConnectedNP(G,result_nodes);
    [result_best, result_nodes_best] = SA_HC_1(G,n,result_nodes,result);
    no_sols = 1;
    
    while toc(t1) < time
        result_nodes = GreedyRandomized(G,n,r);
        result = ConnectedNP(G,result_nodes);
        [result, result_nodes] = SA_HC_1(G,n,result_nodes,result);
        
        if result < result_best
            result_nodes_best = result_nodes;
            result_best = result;
        end
        no_sols = no_sols + 1;
    end
end