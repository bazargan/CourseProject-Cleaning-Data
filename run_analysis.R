
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
        
        # Part 2 of the project: extracting mean and std features
        Features <- read.table("./UCI HAR Dataset/features.txt")
        
        # Part 4 of the project: Not in order but it's easier to work with
        # meaningful labels from the beginning
        colnames(FullDataSet) <- c("Subjects", "Activiities", as.character(Features[,2]))
        
        meanIndex <- grep("mean()", Features[,2])   #Maybe just mean instead of mean()
        stdIndex <- grep("std()", Features[,2])
        mean_std_features <- c(1,2,c(meanIndex, stdIndex) + 2)
        mean_std_DataSet <- FullDataSet[,sort(mean_std_features)]
        
        # Part 3 of the project: Using descriptive activity names instead of numbers
        Activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
        Activities <- Activities[order(Activities[,1]),]
        for (i in 1:nrow(FullDataSet)) {
                mean_std_DataSet[i,2] <- as.character(Activities[mean_std_DataSet[i,2],2])
        }
        
