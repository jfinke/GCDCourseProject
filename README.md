GCDCourseProject
================

Getting and Cleaning Data Coursera Class - Course Project Repository

This script attempts to combine the data provided into one set of data.

The input data files used are:

* X_test.txt
* X_train.txt
* y_test.txt
* y_train.txt
* features.txt
* activity_labels.txt
* subject_test.txt
* subject_train.txt



The train files contain approximately 70% of the original data and the test files contain the other 30% of the original data.

The X files are the files with the actual movement data. They contain a large number of obersvations with 561 variables.

The Y files match up with the X files and contain an extra variable which maps up with the activity label document. (1 = walking)

The subject files contain a reference to who performed the test.

The features file contains the description of the column of the variables.  There are 561 descriptions which match up with the 561 variables in the X files.

The purpose of the assignment is to write a script which does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The features_info gives an overview of the variables.  In order to perform step #2, we need the mean and standard deviation of the observations.  features_info tells us this means we want variables with:

* mean(): Mean value
* std(): Standard deviation

In addition, there are combinations of the following variables for the mean and std:

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag


For example, with tBodyAcc-XYZ, we will grab the following variables for the mean and std:

1. tBodyAcc-mean()-X
2. tBodyAcc-mean()-Y
3. tBodyAcc-mean()-Z
4. tBodyAcc-std()-X
5. tBodyAcc-std()-Y
6. tBodyAcc-std()-Z

With fBodyGyroJerkMag, we will grab the following variables for the mean and std:

1. fBodyBodyGyroJerkMag-mean()
2. fBodyBodyGyroJerkMag-std()

Since this is not measured in three dimensions, there is only one measurement for mean and std.
