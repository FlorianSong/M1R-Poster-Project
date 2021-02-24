function [ node ] = avg( node, updates )


for i = 1:length(node);
         
    node(i).avg = node(i).score / updates;
        
end
end


