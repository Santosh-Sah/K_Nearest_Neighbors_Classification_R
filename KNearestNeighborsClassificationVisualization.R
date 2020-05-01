source("KNearestNeighborsClassificationUtils.R")
library(ggplot2)
library(ElemStatLearn)

#reading training set 
kNearestNeighborsClassificationTrainingSet <- readRDS("KNearestNeighborsClassificationTrainingSet.RDS")

#reading testing set data
kNearestNeighborsClassificationTestingSet <- readRDS("KNearestNeighborsClassificationTestingSet.RDS")



#visualizing training set result
#It will take huge memory. If the system is not advance it will give memory error
visualisingTrainingSetResult <- function(kNearestNeighborsClassificationTrainingSet, kNearestNeighborsClassificationTestingSet){
  
  library(ElemStatLearn)
  set = kNearestNeighborsClassificationTrainingSet
  X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
  X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
  grid_set = expand.grid(X1, X2)
  colnames(grid_set) = c('Age', 'EstimatedSalary')
  y_grid = knn(train = kNearestNeighborsClassificationTrainingSet[, -3], test = grid_set, cl = kNearestNeighborsClassificationTrainingSet[, 3], k = 5)
  plot(set[, -3],
       main = 'K-NN (Training set)',
       xlab = 'Age', ylab = 'Estimated Salary',
       xlim = range(X1), ylim = range(X2))
  contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
  points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
  points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
  
  
  
  ggsave("KNearestNeighborsClassificationTrainingsetResult.png")
  
}

#visualizing testing set result
visualisingTestingSetResult <- function(kNearestNeighborsClassificationTrainingSet, kNearestNeighborsClassificationTestingSet){
  
  library(ElemStatLearn)
  set = kNearestNeighborsClassificationTestingSet
  X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
  X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
  grid_set = expand.grid(X1, X2)
  colnames(grid_set) = c('Age', 'EstimatedSalary')
  y_grid = knn(train = kNearestNeighborsClassificationTrainingSet[, -3], test = grid_set, cl = kNearestNeighborsClassificationTrainingSet[, 3], k = 5)
  plot(set[, -3],
       main = 'K-NN (Training set)',
       xlab = 'Age', ylab = 'Estimated Salary',
       xlim = range(X1), ylim = range(X2))
  contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
  points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
  points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
  
  
  ggsave("KNearestNeighborsClassificationTestingSetResult.png")
  
}

visualisingTrainingSetResult(kNearestNeighborsClassificationTrainingSet, kNearestNeighborsClassificationTestingSet)
visualisingTestingSetResult(kNearestNeighborsClassificationTrainingSet, kNearestNeighborsClassificationTestingSet)