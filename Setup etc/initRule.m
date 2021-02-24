function [ rule ] = initRule(n,k)

rule = zeros(2^k, n);

for i=1:n
    oddcell = randi(4, 1);
    onoroff = randi(2,1)-1;
    
    if onoroff == 0
        rule(:,i) = 1;
        rule(oddcell, i) = 0;
    else
        rule(oddcell, i) = 1;    
    end
end

end

