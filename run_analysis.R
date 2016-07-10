# This script is designed to use the datasets "Human Activity Recognition Using Smartphones Data Set" avaliable 
# at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and create tidy data sets 
# as per the instructions provided for the Getting and Cleaning Data Course Project assignment
#
# The script does the following
# 1. Merge the traing and test data sets into one data set. the script relies on the files provided 
#     and the directory layout as provided by the original data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement from the combined data set.
# 3. Use decriptive label names and activity names in the resulting data set.
# 4. Create a new tidy data set with the average of each variable for each activity and subject
# 
# The script has to be executed in the root folder of the downloaded original dataset. It will create a results folder
# and write out the two data sets.

# load the dplyr library
library(dplyr)

# the following section reads in the list of features, converts it into a vector and transforms the feature names 
#  to descriptive names
# read the list of features from the featues.txt file
features <- read.table("./features.txt", header = FALSE, col.names = c("row.id","feature.name"))
# convert the values of the feature.name column into a vector
features_vector <- features[, "feature.name"]
# make the feature name more descriptive, replace abbreviations with full names
features_vector <- gsub("\\(\\)","", features_vector)
features_vector <- gsub("-",".", features_vector)
features_vector <- sub("^t","time.", features_vector)
features_vector <- sub("^f","frequency.", features_vector)
features_vector <- gsub("Acc","acceleration.", features_vector)
features_vector <- gsub("Body","body.", features_vector)
features_vector <- gsub("Gyro","gyroscope.", features_vector)
features_vector <- gsub("Jerk","jerk.", features_vector)
features_vector <- gsub("Mag","magnitude.", features_vector)
features_vector <- gsub("meanFreq","MeanFrequency", features_vector)
features_vector <- gsub("\\.\\.",".", features_vector)


# read the activity names from the activity_labels.txt file
activity_data <- read.table("./activity_labels.txt", header = FALSE, col.names = c("activity.id", "activity.name"))

# cleanup the activity names by replacing the _ with a space
activity_data <- mutate(activity_data, activity.name = sub("_", " ", activity.name))

# 
# read in the test data sets
# read in the subject test data set
testdata_subject <- read.table("./test/subject_test.txt", header = FALSE, col.names = c("subject.id"))

# read in the activity test data set
testdata_activity <- read.table("./test/y_test.txt", header = FALSE, col.names = c("activity.id"))

# read in the features test data set, nameing the columns using the features_vector
testdata_featuresonly <- read.table("./test/x_test.txt", header = FALSE,    strip.white = TRUE, as.is = TRUE, col.names=features_vector)

# the following section is used to replace the activity ids in the activity test data with the descriptive values
# merge the activity_data and testdata_activity 
testdata_activity_1 <- merge (testdata_activity, activity_data, by.x = "activity.id", by.y = "activity.id")

# Select the activity.name column
testdata_activity_2 <- select(testdata_activity_1, activity.name)

# combine the subject, activity and features test data sets 
testdata <- cbind(testdata_subject, testdata_activity_2, testdata_featuresonly)

# 
# read in the train datasets
# read in the subject training data set
traindata_subject <- read.table("./train/subject_train.txt", header = FALSE, col.names = c("subject.id"))

# read in the activity training data set
traindata_activity <- read.table("./train/y_train.txt", header = FALSE, col.names = c("activity.id"))

# read in the features training data set, nameing the columns using the features_vector
traindata_featuresonly <- read.table("./train/x_train.txt", header = FALSE,    strip.white = TRUE, as.is = TRUE, col.names=features_vector)

# the following section is used to replace the activity ids in the activity training data with the descriptive values
# merge the activity_data and traindata_activity 
traindata_activity_1 <- merge (traindata_activity, activity_data, by.x = "activity.id", by.y = "activity.id")

# Select the activity.name column
traindata_activity_2 <- select(traindata_activity_1, activity.name)

# combine the subject, activity and features training data sets 
traindata <- cbind(traindata_subject, traindata_activity_2, traindata_featuresonly)

# combine the test and training data sets just created
fulldata <- rbind(traindata, testdata)

# select only columns with means, stds and the subject id and activity name
desired_cols <- grepl("subject.id|activity.name|*mean*|*std*", names(fulldata))

# create a subset with only the columns that are being asked for in the assignment. Only features with 
#  means and standard deviations of the measurements are to be included
selecteddata <- fulldata[, desired_cols]

# Group the selecteddata data set by activity and subject and get averages for all the feature variables
aggr_data <- aggregate(selecteddata[,3:68], list(selecteddata$activity.name, selecteddata$subject.id), mean)

# Add average. in front of the feature column names to indicate that they are averages
names(aggr_data) <- gsub("^", "average.", names(aggr_data))

# correct the names of the first two columns
aggr_data <- rename(aggr_data, activity.name = average.Group.1, subject.id  = average.Group.2 )

print (aggr_data)


