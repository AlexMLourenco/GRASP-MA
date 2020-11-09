% Greedy randomized method
function [s] = GreedyRandomized(G,n,r) % valor de R grande?
    E= 1:numnodes(G);
    s= [];
    for i= 1:n
        R= [];
        for j= E
            R= [R ; j ConnectedNP(G,[s j])];
        end
        R= sortrows(R,2);
        e= R(randi(r),1);
        s= [s e];
        E= setdiff(E,e);
    end
end