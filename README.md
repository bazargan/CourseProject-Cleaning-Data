# CourseProject-Cleaning-Data

## This repository contains the files that are related to the assigned project for Getting and Cleaning Data course.
### Purpose of this project is to process the data which is collected from the accelerometer sensors from the Samsung Galaxy S smartphone and create a tidy data set with some specific characteristics that are mentioned on the assignment webpage. 
### Original data and its full description is available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
## List of files included in this repo:
* run_analysis.R
* README.md
* Cook book.txt
* TidyDataset.txt

### The *run_analysis.R* is an R script that processes the data and creates a tidy data set:
#### **NOTE:** For proper execution of this script, it is assumed that the working directory is set to the folder that contains the uncompressed content of the data provided in the project webpage, i.e. working directory contains the unzipped "UCI HAR Dataset" folder. This method was chosen as it speeds up the run time of the script. 		It is also assumed that the *reshape2* library is installed in R before running this script.
#### At first, test and training data sets are read into R and combined as part 1 of the assignment. Then, the features that are measured for each observation are read into R and then are used to find the parameters that represent either the **mean** or **standard deviation** of variables. Dataset is reduced to contain only these variables hence the part 2.
#### At this step, names of the variables are also added as labels to the data set (part 4). This is done out of order, i.e. before part 3, because there was no indication of the importance of the order these tasks are done and also because it makes it easier to work with the data and trace the script.
#### Next step is to read the activity names into R and use these descriptive names as opposed to integer numbers that were initially used in the data set (part 3).
#### Then, the data set is reshaped to summarize the data and create a tidy data set that contains the average of each variable for each subject and each activity (part 5). Variable names are also consequently changed to represent the change in the value, as they are now averaged over the given subject and activity. This tidy data set is then written into "TidyDataset.txt" file in the "UCI HAR dataset" folder.
### *README.md* describes how the script is implemented and how it works, it also has information about the files that are included in the repo.
### *Cook book.txt* contains the information about the variables that are included in the output of the script.
### *TidyDataset.txt* is the tidy data set that is created by running the script. It is submitted separately in the assignment page but it is included here as well for the ease of access. 

     
