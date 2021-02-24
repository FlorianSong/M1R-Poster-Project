function [node, conn, rule, oldnodes] = StepB(node, conn, rule, oldnodes, i)

% Find the Loser first
[loser, node] = findLoser(node);

node(loser).lifetime = node(loser).lifetime - 1;

% Archive loser

oldnodes(i) = node(loser);

% Perform Selection: Replace rule and conn for loser-node
[node, conn, rule] = Selection(node, conn, rule, loser);

end