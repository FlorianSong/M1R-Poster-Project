function [node, oldnodes, tsm, Attr] = Run (n, k, maxsteps, cycles)


% Initialise Network
[node, conn, rule] = Initialise(n, k);



% Initialise oldnodes & Attr
oldnodes(cycles) = node(1);
Attr(cycles).trans = 0;
Attr(cycles).period = 0;
Attr(cycles).tsm = [];


% Iterate cycles

for i=1:cycles
    
    
    % STEP A
    [node, tsm, Attr(i)] = StepA(node, maxsteps);
    
    
    % Increase lifetime
    for j = 1:n
        node(j).lifetime = node(j).lifetime + 1;
    end
    
    
    % STEP B
    [node, conn, rule, oldnodes] = StepB(node, conn, rule, oldnodes, i);    
    
    
    
    % Add & reset score    
    for k = 1:n
        node(k).total = node(k).total + node(k).score;
        node(k).score = 0;
    end
    
end

end