function [result_best result_nodes_best no_sols] = MA(G,n,time,psize,q,m,r)
    t1 = tic;
    p = zeros(psize,9);
    for i = 1:psize
        result_nodes = GreedyRandomized(G,n,r);
        result = ConnectedNP(G,result_nodes);
        [result_best, result_nodes_best] = SA_HC_1(G,n,result_nodes,result);
        p(i,:) = [result_nodes_best result_best]; % parents
    end
    no_sols = 1;
    
    while toc(t1) < time
        new_p = zeros((psize-m),9);
        for i = 1:(psize-m)
            [x] = Crossover(G, p, n);
            if rand() < q % 5%
                [x] = Mutation(G, x, n);
            end
            [result_best, x] = SA_HC_1(G,n,x(1:8),x(9));
            new_p(i,:) = [x result_best]; % sons
        end
        [s] = Selection(p,new_p,m);
        p = s;
        no_sols = no_sols + 1;
    end
[best_result best_result_nodes] = Best(p);
result_best = best_result;
result_nodes_best = best_result_nodes;
end