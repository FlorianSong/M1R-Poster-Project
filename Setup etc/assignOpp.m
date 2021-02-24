function [ node ] = assignOpp( node )

n = length(node);


for i = 1:n

% Assign some opponent
    
    flag = 1;
    while flag
        S = setdiff(1:n, i);
        opp = S(randi(length(S), 1));
        
        flag = ismember(opp, node(i).agg);
    end   
        
    node(opp).agg = [node(opp).agg, i];
    node(i).opp = opp;
    
end

end

