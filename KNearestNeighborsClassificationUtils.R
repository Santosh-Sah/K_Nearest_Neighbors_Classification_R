importKNearestNeighborsClassificationDataset <- function(KNearestNeighborsClassificationDatasetFileName) {
  
  #importing dataset
  kNearestNeighborsClassificationDataset = read.csv(KNearestNeighborsClassificationDatasetFileName)
  
  #getting the required columns
  kNearestNeighborsClassificationDataset = kNearestNeighborsClassificationDataset[3:5]
  
  #encoding target feature as factor
  kNearestNeighborsClassificationDataset$Purchased = factor(kNearestNeighborsClassificationDataset$Purchased, levels = c(0, 1))
  
  #splitting the dataset into training set and testing set
  library(caTools)
  set.seed(1234)
  
  kNearestNeighborsClassificationDatasetSlpit = sample.split(kNearestNeighborsClassificationDataset$Purchased, SplitRatio = 0.75)
  
  kNearestNeighborsClassificationTrainingSet = subset(kNearestNeighborsClassificationDataset, kNearestNeighborsClassificationDatasetSlpit == TRUE)
  
  kNearestNeighborsClassificationTestingSet = subset(kNearestNeighborsClassificationDataset, kNearestNeighborsClassificationDatasetSlpit == FALSE)
  
  
  returnList <- list(kNearestNeighborsClassificationTrainingSet, kNearestNeighborsClassificationTestingSet)
  
  return (returnList)
  
}

#saving training and testing set
saveTrainingAndTestingDataset <- function(kNearestNeighborsClassificationTrainingSet, kNearestNeighborsClassificationTestingSet){
  
  saveRDS(kNearestNeighborsClassificationTrainingSet, file = "KNearestNeighborsClassificationTrainingSet.RDS")
  saveRDS(kNearestNeighborsClassificationTestingSet, file = "KNearestNeighborsClassificationTestingSet.RDS")
  
}

#Save LogisticRegression Model
saveLogisticRegressionModel <- function(logisticRegressionModel) {
  
  saveRDS(logisticRegressionModel, file = "LogisticRegressionModel.RDS")
}

#Save prediced values for testing set
savekNearestNeighborsClassificationPredictedValues <- function(kNearestNeighborsClassificationPredictedValues) {
  
  saveRDS(kNearestNeighborsClassificationPredictedValues, file = "KNearestNeighborsClassificationPredictedValues.RDS")
}
