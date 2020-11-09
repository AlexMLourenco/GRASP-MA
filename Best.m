% Best Individual of the population
function [best_result best_result_nodes] = Best(p)
    p = sortrows(p,9);
    best_result_nodes = p(1,1:8);
    best_result = p(1,9);
end