function [node, tsm, Attr] = StepA(node, maxsteps, cycle)

n = length(node);


% Initialise tsm
tsm = zeros(n, 1);
tsm(:,1) = [node.state];

% Initialise flag
attrFound = 0; 

for i = 1:maxsteps
    
    % Games
    node = Games(node);
       
    % One Evolution    
    [node, timeStateMatrix] = evolve(node);
    
    % Write to timeStateMatrix
    
    tsm(:, i+1) = timeStateMatrix;
    
    % Check for attractor (unstable and only for non-Darwinian suitable)
    
    if attrFound == 0
        for j=1:i
            nbIdenticalNodes = length(find(tsm(:,i+1) == tsm(:,j)));
            if nbIdenticalNodes == n
                attrFound = 1;
                transient = j-1;
                period = i+1-j;
                tsmattr = tsm(:, transient+1:transient + period+1);
                break
            end
        end
    end
    
    if attrFound == 1
        break
    end
    
    
end


% If no attractor was found, set transient & period to inf and tsmattr to empty
% matrix

if attrFound == 0
    transient = inf;
    period = inf;
    tsmattr = [];    
end

% Write all information about Attractor in structure array

Attr.trans = transient;
Attr.period = period;
Attr.tsm = tsmattr;


    
% Take average score

updates = transient + period;
node = avg(node, updates);


end