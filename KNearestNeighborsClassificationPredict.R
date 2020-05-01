source("KNearestNeighborsClassificationUtils.R")

#reading training set 
kNearestNeighborsClassificationTrainingSet <- readRDS("KNearestNeighborsClassificationTrainingSet.RDS")

#new data set
inputValue <- data.frame(Age = c(28,30), EstimatedSalary = c(43000,30000))

#feature scaling
kNearestNeighborsClassificationTrainingSet[-3] = scale(kNearestNeighborsClassificationTrainingSet[-3])
inputValue[, 1:2] = scale(inputValue[, 1:2])

library(class)

# predicting for new values
kNearestNeighborsClassification_y_pred = knn(train = kNearestNeighborsClassificationTrainingSet[, -3],
                                             test = inputValue[, 1:2],
                                             cl = kNearestNeighborsClassificationTrainingSet[, 3],
                                             k = 5)

kNearestNeighborsClassification_y_pred
