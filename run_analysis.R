# This is a script to do the course assignement for Getting and Cleaning Data
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Load libraries for processing
library("plyr")

# Load X_test data
X_test <- read.table("X_test.txt", quote="\"")

# Load X_train data
X_train <- read.table("X_train.txt", quote="\"")

# Load features
features <- read.table("features.txt", quote="\"")
# Transform features
headings<-features[2]
theadings<-t(headings)
theadings2<-as.data.frame(theadings)


X <- rbind.fill(theadings2,X_test, X_train) #combining the three dataframes