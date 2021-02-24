function nodeUpdated = displayTopologyMODEL(node, connection, optionString)

option = strcmp(optionString, 'arrow');

n = length(connection);

% calculate coordinates of the nodes and the corresponding label 
theta = 2*pi./n;
angle = theta*(0:(n-1));

radius = n* ones(1,length(angle));
textRadius =  n*( ones(1,length(angle)) + 0.2);

x = radius .* cos(angle);
y = radius .* sin(angle);

textX = textRadius .* cos(angle);
textY =  textRadius .* sin(angle);

nodeUpdated = node;
fHandle = figure;
figure(fHandle);

str = sprintf('Network Topology for N = %d and K = %d', n, sum(connection(:,1)));
set(fHandle,'Color','w','Name', str);

% display nodes: 0 (off) = black, 1 (on) = white
for m = 1:n
    if(nodeUpdated(m).state == 0)
        h = rectangle('Position',[x(m)-0.5, y(m)-0.5, 1, 1], 'Curvature', [1,1], 'FaceColor','k');  
    else  
        h1 = rectangle('Position',[x(m)-0.5, y(m)-0.5, 1, 1], 'Curvature', [1,1], 'FaceColor','w');  
    end
end


grid off;
colormap lines;
cmap = colormap;
colorbar('horiz'); 


if(option)       % plot directed edges with arrow
    axis(axis);  % prevent axis redimensioning (trick)

    for j=1:n
        text(textX(j), textY(j), int2str(j),'Color','m');

        nodeUpdated(j).output = [];


        indices = find(connection(j,:));

        for k=1:length(indices)
            multiplicity(k) = connection(j,indices(k));    
        end

        for m=1:length(indices)
            nodeUpdated(j).output = [nodeUpdated(j).output repmat(indices(m),1,multiplicity(m))];        
            if(j == indices(m))
                rectangle('Position',[x(j)-1.9, y(j)-1.5, 2, 2], 'Curvature', [1,1],'EdgeColor',cmap(multiplicity(m),:));                       
            end  
            arrow([x(j) y(j)] , [x(indices(m)) y(indices(m))],'FaceColor', cmap(multiplicity(m),:),'EdgeColor',cmap(multiplicity(m),:));

        end       

    end


else          %plot directed edges as line only
    for j=1:n
        text(textX(j), textY(j), int2str(j),'Color','m');

        nodeUpdated(j).output = [];


        indices = find(connection(j,:));
        for k=1:length(indices)
            multiplicity(k) = connection(j,indices(k));    
        end

        for m=1:length(indices)
            nodeUpdated(j).output = [nodeUpdated(j).output repmat(indices(m),1,multiplicity(m))];        
            if(j == indices(m))
                rectangle('Position',[x(j)-1.9, y(j)-1.5, 2, 2], 'Curvature', [1,1],'EdgeColor',cmap(multiplicity(m),:));                       
            else    
                line([x(j) x(indices(m))] , [y(j) y(indices(m))],'Color', cmap(multiplicity(m),:));
            end 
        end       

    end

end

% display legend
text(n,-n,'black = off (0)');
text(n,-n*.9,'white = on (1)');
text(-n*0.7,-n*2.2,'Number of connections')

axis equal;
axis off;
cameratoolbar('Show');
cameratoolbar('SetMode','zoom');