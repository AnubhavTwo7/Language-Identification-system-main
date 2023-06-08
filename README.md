A language identification system in **MATLAB** which uses a **GMM** model based on the excitation features of **7 Indian** languages.
The dataset can be downloaded from [lid – Google Drive](https://drive.google.com/drive/folders/1zoAXZO0uAljn8Xw-Xh1w1rPEiex9Q9O2)

- feature_train -------------- for extracting training features from traindata folder (obtained from LID dataset)
  
- feature_test -------------- for extracting testing features from testdata folder (obtained from LID dataset)
  
- gmmtraing----------------for training the gmm models for each language
  testingwithgmmmodel-------for testing the gmm model for an unknown language
  
- separation---------------for seperating testing and traing data from given LID data base.
  

add fullBnt and voicebox to setpath in matlab

Steps to follow:

1. run seperation.m to split the dataset in 8:2 (training:testing) ratio to create the training and testing datasets.
  
2. run feature_train.m to extract the feature vectors for each language
  
3. run feature_test.m to extract the feature vectors for each test audio file
  
4. run gmmtraining.m to initialize and train our gmm model with the given training samples.
  
5. run testingwithGMMmodel.m to test our model's accuracy by make predictions on the testing samples. (variable named percentage denotes the accuracy)
