function node = linenumber(node)


statevector = [node([node.input]).state];
% statematrix = (vec2mat(statevector,2))';
statematrix = (reshape(statevector,2, length(statevector)/2));

W = [2,1];
lineNumbers = (W*statematrix)+1;
lineNumbers2 = num2cell(lineNumbers);
[node(1:length(node)).lineNumber] = deal(lineNumbers2{:});

% tic;
% for i=1:length(node)
%     statevector = zeros(1,length(node(i).input));
%     for k=1:length(node(i).input)
%         statevector(k) = node(node(i).input(k)).state;
%     end    
%     node(i).lineNumber2 = polyval(statevector,2)+1;
% end
% toc;
% 
% [node.lineNumber2] = deal([]);

end

