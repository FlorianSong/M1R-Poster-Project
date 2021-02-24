function [ node ] = applyRule(node, rule)

for i=1:length(node)
    node(i).rule = rule(:,i);
end

end

