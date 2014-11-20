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
