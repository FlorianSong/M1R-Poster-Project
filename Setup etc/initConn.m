function [ conn ] = initConn(n, k)

conn = zeros(n,n);
for i=1:n
    success = 0; 
    while success < k
        a=randi(n-1, 1);

        if a>=i
            a=a+1;
        end

        conn(a,i) = conn(a,i) + 1;
        success = success + 1;
    end
end

end

