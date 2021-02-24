function [ node ] = applyConn(node, conn)

[node.input] = deal([]);

for i=1:length(node)
    
    indices = find(conn(:,i))';
    

    % get number of incoming conns from a particular node (multiplicity)
    multiplicity = conn(indices, i);
    
    
    % set input vector
    if multiplicity == 2,
        node(i).input = [indices, indices];
    else 
        node(i).input = indices;
    end
        
        

end

end

