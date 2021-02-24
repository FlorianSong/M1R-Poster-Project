function [ node, timeStateMatrix ] = evolve( node )

n = length(node);

timeStateMatrix = zeros(n,1);

% Evolve network

node = linenumber(node);
node = nextState(node);


% Evolution by setting states to values of nextState

nextStates = num2cell([node.nextState]);
[node(1:n).state] = deal(nextStates{:});



timeStateMatrix(:,1) = [node.state];

end

