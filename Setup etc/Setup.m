function [node, conn, rule] = Setup(n,k)

% Initialise Nodes

node = initNode(n);

% Initialise conns

conn = initConn(n,k);

% Initialise Rules with variable p

rule = initRule(n,k);

% Apply conns

node = applyConn(node, conn);

% Apply Rule Vector

node = applyRule(node, rule);

end
