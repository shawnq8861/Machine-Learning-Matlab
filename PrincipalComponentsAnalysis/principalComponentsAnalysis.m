% generate 1000 randomly distributed data points with x and y two features 
x=randn(1000,1);
y=10*x + 10.*randn(1000,1)-5;
A = horzcat(x,y);
figure(1);
subplot(1,2,1),scatter(A(:,1),A(:,2));
% calculate the first principle component and do the projection
% do this by calling the pca function with an argument of 1
% then multiply the origonal matrix by the first principal component
firstComp = pca(A,'NumComponents',1);
AProject = A*firstComp;
% reconstruct the original two variables from this one principal component 
% multiply the projection by the transpose of the first principal component
AReconstruct = AProject*(transpose(firstComp));
figure(2);
subplot(1,2,1),scatter(AReconstruct(:,1),AReconstruct(:,2));
% load the data
load 'C:\MatlabProjects\PrincipalComponentsAnalysis\USPS.mat';
% reshape the row of data into image matrix 16 x 16 pixels
A1 = reshape(A(1,:),16,16);
A2 = reshape(A(2,:),16,16);
% call imshow to display each image
figure(3);
imshow(A1);
figure(4);
imshow(A2);
% call pca to find the first 10 principal components of the original data
first10 = pca(A,'numComponents',10);
%{ multiply original data by principal components matrix followed by the transpose of the Principal components matrix to create reconstructed matrix %}
ARecon10 = A*first10*transpose(first10);
% reshape and display the new images
A1R10 = reshape(ARecon10(1,:),16,16);
A2R10 = reshape(ARecon10(2,:),16,16);
figure(5);
imshow(A1R10);
figure(6);
imshow(A2R10);
% call pca to find the first 50 principal components of the original data
first50 = pca(A,'numComponents',50);
%{ multiply original data by principal components matrix followed by the transpose of the Principal components matrix to create reconstructed matrix %}
ARecon50 = A*first50*transpose(first50);
% reshape and display the new images
A1R50 = reshape(ARecon50(1,:),16,16);
A2R50 = reshape(ARecon50(2,:),16,16);
figure(7);
imshow(A1R50);
figure(8);
imshow(A2R50);
% call pca to find the first 100 principal components of the original data
first100 = pca(A,'numComponents',100);
%{ multiply original data by principal components matrix followed by the transpose of the Principal components matrix to create reconstructed matrix %}
ARecon100 = A*first100*transpose(first100);
% reshape and display the new images
A1R100 = reshape(ARecon100(1,:),16,16);
A2R100 = reshape(ARecon100(2,:),16,16);
figure(9);
imshow(A1R100);
figure(10);
imshow(A2R100);
% call pca to find the first 100 principal components of the original data
first200 = pca(A,'numComponents',200);
%{ multiply original data by principal components matrix followed by the transpose of the Principal components matrix to create reconstructed matrix %}
ARecon200 = A*first200*transpose(first200);
% reshape and display the new images
A1R200 = reshape(ARecon200(1,:),16,16);
A2R200 = reshape(ARecon200(2,:),16,16);
figure(11);
imshow(A1R200);
figure(12);
imshow(A2R200);
errA110 = immse(A1,A1R10);
errA110
errA150 = immse(A1,A1R50);
errA150
errA1100 = immse(A1,A1R100);
errA1100
errA1200 = immse(A1,A1R200);
errA1200
errA210 = immse(A2,A2R10);
errA210
errA250 = immse(A2,A2R50);
errA250
errA2100 = immse(A2,A2R100);
errA2100
errA2200 = immse(A2,A2R200);
errA2200