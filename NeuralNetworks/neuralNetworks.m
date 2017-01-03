% load the data from the file %
data = load('C:\MatlabProjects\NeuralNetworks\USPS_all.mat')

% extract fields from struct and prepare data for nn %
fea = data.fea;
gnd = data.gnd;
x = fea(:, :)';
t = full(ind2vec(gnd(:, :)'));
% create a network %
net = patternnet([100 100]);
% view the network %
view(net);
% train the network %
[net,tr] = train(net,x,t);
% separate out the test samples %
testX = x(:,tr.testInd);
testT = t(:,tr.testInd);
% calculate the test outputs %
testY = net(testX);
testIndices = vec2ind(testY);
% plot the confusion matrix %
plotconfusion(testT,testY);
[c,cm] = confusion(testT,testY);
% print out the confusion matrix %
c
cm
fprintf('Percentage Correct Classification   : %f%%\n', 100*(1-c));
fprintf('Percentage Incorrect Classification : %f%%\n', 100*c);
% plot the receiver operating characteristic %
plotroc(testT,testY);