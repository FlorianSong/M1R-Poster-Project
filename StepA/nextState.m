function node = nextState(node)


% for i=1:length(node)
%     node(i).nextState = node(i).rule(node(i).lineNumber,1);
% end


rule = [node.rule];
lineNumbers = [node.lineNumber];
linInd = sub2ind (size(rule), lineNumbers, [1:length(node)]);

nextStates = num2cell( rule(linInd) );
[node.nextState] = deal(nextStates{:});


end

