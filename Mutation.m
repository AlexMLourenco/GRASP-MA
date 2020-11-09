% Each offspring individual is mutated with a given probability
function [offspring] = Mutation(G, p, n)
    
    N = numnodes(G);
    aux = setdiff(1:N,p);
    offspring = [p(randperm(size(p,2)-1,n-1)) aux(randperm(N-size(p,2)-1,1))];
    offspring = [offspring ConnectedNP(G, offspring)];

end