function [node, conn, rule] = Initialise(n, k, varargin)

% Setup the network
[node, conn, rule] = Setup(n,k);


% Display the network?
if nargin == 3
    node = displayTopologyMODEL(node, conn, varargin{1});
end


% Assign Opponent
node = assignOpp(node);


end


