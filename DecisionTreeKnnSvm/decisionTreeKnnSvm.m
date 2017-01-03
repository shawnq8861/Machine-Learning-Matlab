% Decision Tree
% load the data from the file %
data = load('C:\MatlabProjects\DecisionTreeKnnSvm\USPS_all.mat');
data
% create matrix of training data %
trainData = fea(1:7291,:);
% create matrix of training labels %
trainLabels = gnd(1:7291,:);
% create matrix of test data %
testData = fea(7292:9298,:);
% create matrix of test labels %
testLabels = gnd(7292:9298,:);
% train the decision tree model and measure training time %
tic;
decTree = fitctree(trainData, trainLabels);
decTreeElapsedTime = toc;
decTreeElapsedTime
% show the tree %
view(decTree,'Mode','graph');
% predict the labels of the test data by running the data through the tree %
treePredict = predict(decTree, testData);
% calculate error matrix by subtracting treePredict from testLabels %
treeError = testLabels - treePredict;
% calculate percent accurately predicted %
treeNumCorr = sum(treeError(:) == 0);
treePercentCorr = 100*(treeNumCorr/2007);
treePercentCorr
% decision tree confusion matrix %
treeConfusion = confusionmat(testLabels, treePredict);
treeConfusion
% KNN
% Use same data already loaded for decision tree %
% train the KNN classifier and measure training time %
tic;
knnModel = fitcknn(trainData, trainLabels);
knnElapsedTime = toc;
knnElapsedTime
% predict the labels of the test data by running the data through the knn model %
knnPredict = predict(knnModel, testData);
% calculate error matrix by subtracting knnPredict from testLabels %
knnError = testLabels - knnPredict;
% calculate percent accurately predicted %
knnNumCorr = sum(knnError(:) == 0);
knnPercentCorr = 100*(knnNumCorr/2007);
knnPercentCorr
% knn confusion matrix %
knnConfusion = confusionmat(testLabels, knnPredict);
knnConfusion
% Support Vector Machine
% Use same data already loaded for decision tree %
% train the multiclass SVM classifier, with one vs all, linear and measure training time %
t = templateLinear();
tic;
svmModel = fitcecoc(trainData, trainLabels,'Coding','onevsall','Learners',t);
svmElapsedTime = toc;
svmElapsedTime
% predict the labels of the test data by running the data through the svm model %
svmPredict = predict(svmModel, testData);
% calculate error matrix by subtracting testPredict from testLabels %
svmError = testLabels - svmPredict;
% calculate percent accurately predicted %
svmNumCorr = sum(svmError(:) == 0);
svmPercentCorr = 100*(svmNumCorr/2007);
svmPercentCorr
% svm confusion matrix %
svmConfusion = confusionmat(testLabels, svmPredict);
svmConfusion
