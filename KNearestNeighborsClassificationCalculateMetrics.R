source("KNearestNeighborsClassificationUtils.R")

#reading testing set 
kNearestNeighborsClassificationTestingSet <- readRDS("KNearestNeighborsClassificationTestingSet.RDS")

#reading reading predicted values for testing set 
kNearestNeighborsClassificationPredictedValues <- readRDS("KNearestNeighborsClassificationPredictedValues.RDS")

kNearestNeighborsClassificationConfusionMatrix = table(kNearestNeighborsClassificationTestingSet[, 3], 
                                                        kNearestNeighborsClassificationPredictedValues)

kNearestNeighborsClassificationConfusionMatrix

#    0  1
# 0 56  8
# 1  4 32
