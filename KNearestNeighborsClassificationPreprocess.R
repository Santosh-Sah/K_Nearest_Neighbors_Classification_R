source("KNearestNeighborsClassificationUtils.R")

kNearestNeighborsClassificationDatasetList <- importKNearestNeighborsClassificationDataset("KNearest_Neighbors_Classification_Social_Network_Ads.csv")

saveTrainingAndTestingDataset(kNearestNeighborsClassificationDatasetList[[1]], kNearestNeighborsClassificationDatasetList[[2]])
