clear
close all
clc
 
% load and show the original data %
% run for values of threshold = 0.43, 0.49, 0.51, 0.53
threshold = 0.43;
[map,s] = ReadMRC('C:\MatlabProjects\Clustering\1oaiA00.mrc');
densityIndx = find(map>threshold);
size = size(map);
[x,y,z] = ind2sub(size,densityIndx); 
xyzPoints = horzcat(x,y,z);
figure(1);
plot3(xyzPoints(:,1),xyzPoints(:,2),xyzPoints(:,3),'.');
hold off
xlabel('X');
ylabel('Y');
zlabel('Z');
view(-137,10);
 
% K-means clustering %
for k = 3:5
    figure(k-1);
    hold on
    [idx,C] = kmeans(xyzPoints,k);
    scatter3(xyzPoints(:,1), xyzPoints(:,2), xyzPoints(:,3), 20, idx(:,1), 'o');
    scatter3(C(:,1), C(:,2), C(:,3), 100, 'Marker', 'x', 'MarkerFaceColor', 'black', 'MarkerEdgeColor', 'black', 'LineWidth', 4);
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    hold off
    view(-137,10);
end

% Hierarchical clustering %
for k = 3:5
    hierC = clusterdata(xyzPoints, 'linkage', 'ward', 'savememory', 'on', 'maxclust', k);
    figure(k+2);
    scatter3(xyzPoints(:,1), xyzPoints(:,2), xyzPoints(:,3), 20, hierC(:,1));
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    view(-137,10);
    tree = linkage(xyzPoints, 'average');
    figure(k+5);
    dendrogram(tree, 0);
end