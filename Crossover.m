% Combines the genes of two parent individuals to generate the genes of an
% offspring individual
function [offspring] = Crossover(G, p, n)
    
    E = p;
    parent = zeros(2,9);
    
    % Parent selection
    for i = 1:2
        a = E(randperm(size(E,1),2),:); % size duma coluna
        
        if a(1,9) > a(2,9)
            parent(i,:) = a(2,:);
        else
            parent(i,:) = a(1,:);
        end
        E = setdiff(E, parent, 'rows');
    end
    
    % Gene combination
    offspring = unique([parent(1,1:8) parent(2,1:8)]);
    offspring = offspring(randperm(size(offspring,2), n));
    offspring = [offspring ConnectedNP(G, offspring)];
end