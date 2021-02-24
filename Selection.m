function [node, conn, rule] = Selection(node, conn, rule, loser)


n = length(node);

% Select a new rule

oddcell = randi(4);
onoroff = randi(2)-1;

if onoroff == 0
    rule(:,loser) = 1;
    rule(oddcell, loser) = 0;
else
    rule(:,loser) = 0;
    rule(oddcell, loser) = 1;
end

% Apply rule

node = applyRule(node, rule);

% Replace connections

w = sum(conn(:,loser));
conn(:, loser) = 0;

success = 0; 

while success < w

    a=randi(n-1, 1);

    if a>=loser
        a=a+1;
    end

    conn(a,loser) = conn(a,loser) + 1;
    success = success + 1;
end

% Apply Connections

node = applyConn(node, conn);

% Assign new opponent

aggressors = node(node(loser).opp).agg;
aggressors(aggressors == loser) = [];
node(node(loser).opp).agg = aggressors;


flag = 1;
while flag
    S = setdiff(1:n, loser);
    opp = S(randi(length(S), 1));

    flag = ismember(opp, node(loser).agg);
end   

node(opp).agg = [node(opp).agg, loser];
node(loser).opp = opp;


% Reset lifetime
node(loser).lifetime = 0;

% Randomly choose Boolean
node(loser).state = randi(2) - 1;

end

