source("KNearestNeighborsClassificationUtils.R")

#reading training set 
kNearestNeighborsClassificationTrainingSet <- readRDS("KNearestNeighborsClassificationTrainingSet.RDS")

#reading testing set 
kNearestNeighborsClassificationTestingSet <- readRDS("KNearestNeighborsClassificationTestingSet.RDS")

#feature scaling training set
kNearestNeighborsClassificationTrainingSet[-3] = scale(kNearestNeighborsClassificationTrainingSet[-3])

#feature scaling testing set
kNearestNeighborsClassificationTestingSet[-3] = scale(kNearestNeighborsClassificationTestingSet[-3])

library(class)

# Fitting K-NearestNeighborsClassification to the Training set
kNearestNeighborsClassification_y_pred = knn(train = kNearestNeighborsClassificationTrainingSet[, -3],
                                             test = kNearestNeighborsClassificationTestingSet[, -3],
                                             cl = kNearestNeighborsClassificationTrainingSet[, 3],
                                             k = 5)

#saving NearestNeighborsClassification Predicted Values
savekNearestNeighborsClassificationPredictedValues(kNearestNeighborsClassification_y_pred)
