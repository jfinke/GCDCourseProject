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
# Load y_test data
y_test <- read.table("y_test.txt", quote="\"")
# Load subject_test data
subject_test <- read.table("subject_test.txt", quote="\"")

# Load X_train data
X_train <- read.table("X_train.txt", quote="\"")
# Load y_train data
y_train <- read.table("y_train.txt", quote="\"")
# Load subject_train data
subject_train <- read.table("subject_train.txt", quote="\"")

# Load features
features <- read.table("features.txt", quote="\"")
# Transform features
headings<-features[2]
theadings<-t(headings)

# Load Activities
activity_labels <- read.table("activity_labels.txt", quote="\"")
colnames(activity_labels)<-c("Activities","ActivityNames")


X <- rbind.fill(X_test, X_train) #combining the two X dataframes
y <- rbind.fill(y_test, y_train) #combining the two y dataframes
s <- rbind.fill(subject_test, subject_train) #combining the two subject dataframes


colnames(X)<-theadings #assinging column names to X
colnames(y)<-"Activities" # Assigning column name to y
colnames(s)<-"Subject" # Assigning column name to s


# Need to get the columns that have mean() and std()
cols<-grep('mean\\(\\)|std\\(\\)',names(X))

ms<-X[,cols] # Assigning the mean and std to a new dataframe

#cleaning up column names
mscolnames<-colnames(ms)
tmp<-make.names(mscolnames)
mscolnamesclean<-gsub("[.]", "",tmp)
colnames(ms)<-mscolnamesclean

full<-cbind(ms, s, y) # All of the data in a single dataframe

# Joining the Activity Names to the full dataframe
fullactiv <- join(full, activity_labels, by = "Activities", type="left")
fullactiv$Activities<-NULL # Removing id joining column, data should be tidy


# Aggregating the mean per the Activity Name and Subject
attach(fullactiv)
final<-aggregate(fullactiv, by=list(ActivityNames,Subject), FUN=mean, na.rm=TRUE)

# Cleaning up the tmp after the aggregation
final$ActivityNames<-NULL
final$Subject<-NULL
colnames(final)[1]<-"Activity"
colnames(final)[2]<-"Subject"

# Reordering first two columns for my gratification
final <- final[, c(2,1,3:68)]
