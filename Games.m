function [node] = Games(node) 

for i = 1:length(node) 
   if node(i).state == node(node(i).opp).state
      node(i).score = node(i).score + 1;
      node(node(i).opp).score = 
      node(node(i).opp).score - 1;
   else 
      node(i).score = node(i).score - 1;
      node(node(i).opp).score = 
      node(node(i).opp).score + 1;
   end    
end