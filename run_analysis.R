        library(reshape2)
        TestSet <- read.table("./UCI HAR Dataset/test/X_test.txt")
        TestSubjectSet <- read.table("./UCI HAR Dataset/test/subject_test.txt")
        TestActivitySet <- read.table("./UCI HAR Dataset/test/y_test.txt")
        TestData <- cbind("Subject"=TestSubjectSet, "Activity"=TestActivitySet, "Feature Vector"=TestSet)
        
        TrainSet <- read.table("./UCI HAR Dataset/train/X_train.txt")
        TrainSubjectSet <- read.table("./UCI HAR Dataset/train/subject_train.txt")
        TrainActivitySet <- read.table("./UCI HAR Dataset/train/y_train.txt")
        TrainData <- cbind("Subject"=TrainSubjectSet, "Activity"=TrainActivitySet, "Feature Vector"=TrainSet)
        
        # Part 1 of the project: combining test and traning datasets
        FullDataSet <- rbind(TestData, TrainData)
        
        # Part 2 and 4 of the project: extracting mean and std features, and labeling the variables (Step 4 
        # is done early on as it is helpful to have the right lables for debugging purposes)
        Features <- read.table("./UCI HAR Dataset/features.txt")
        
        colnames(FullDataSet) <- c("Subject", "Activity", as.character(Features[,2]))
        
        meanIndex <- grep("mean", Features[,2])
        stdIndex <- grep("std", Features[,2])
        mean_std_FeatureIndex <- sort(c(meanIndex, stdIndex))
        mean_std_DatasetIndex <- c(1,2, mean_std_FeatureIndex + 2)
        mean_std_DataSet <- FullDataSet[,mean_std_DatasetIndex]
        
        # Part 3 of the project: Using descriptive activity names instead of numbers
        Activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
        Activities <- Activities[order(Activities[,1]),]
        for (i in 1:nrow(FullDataSet)) {
                mean_std_DataSet[i,2] <- as.character(Activities[mean_std_DataSet[i,2],2])
        }
        
        # Part 5 of the project: Creating an independent tidy data set with the
        # average of each variable in the feature list for each activity and each subject  
        variables <- Features[mean_std_FeatureIndex,2]
        DataMelted <- melt(mean_std_DataSet, id=c("Subject", "Activity"), measure.vars = variables)
        ReshapedData = dcast(DataMelted, Subject + Activity ~ variables, mean)
        
        # Changing the name of variables to indicate that these values are now averaged over Subject and Activity
        ReshapedDataNames <- names(ReshapedData)
        for (i in 1:length(mean_std_FeatureIndex)) {
                ReshapedDataNames[i+2] <- paste("Averaged", ReshapedDataNames[i+2], sep="-")
        }
        colnames(ReshapedData) <- ReshapedDataNames
        
        write.table(ReshapedData, "./UCI HAR Dataset/TidyDataset.txt", row.names = FALSE)