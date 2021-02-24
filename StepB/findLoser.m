function [loser, node] = findLoser(node)

% Vector of all scores 
scorevector = [node.score];

m = min(scorevector);

% Positions of all losers
losers = find(scorevector < m+1);

% Select one at random
r = randi(length(losers), 1);

loser = losers(r);

end