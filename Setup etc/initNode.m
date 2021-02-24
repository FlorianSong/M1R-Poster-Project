function [ node ] = initNode(n)

for i=1:n
    node(i).position     = i;
    node(i).state        = randi(2,1)-1;
    node(i).nextState    = 0;
    node(i).lifetime     = 0;
    node(i).input        = [];
    node(i).output       = [];
    node(i).lineNumber   = 0;
    node(i).rule         = [];
    node(i).score        = 0;
    node(i).total        = 0;
    node(i).avg          = 0;
    node(i).agg          = [];
    node(i).opp          = 0;
end   

end

