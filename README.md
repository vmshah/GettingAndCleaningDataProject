# GettingAndCleaningDataProject
Getting and Cleaning Data Course Project Assignment

This GIT repository contains the files that were created for the Getting and Cleaning Data Course Project Assignment.
The files included are (besides this README)

1. run_analysis.R
2. CodeBook.md

The script provided here is to be used on the Smartphone accelerometers data collected based on Human activity and available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. The details on the collected data used here is available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

The *run_analysis.R* script does the following using the downloaded data sets

1. Extracts the activity names and accelarometer data feature names and makes them descriptive.
2. Reads the test data sets with subject, activity and feature data and combines them into a data frame. It also assigns the descriptive feature names as column names. The activity ids are replaced with the descriptive activity names.
3. Reads the training data sets with subject, activity and feature data and combines them into a data frame. It also assigns the descriptive feature names as column names. The activity ids are replaced with the descriptive activity names.
4. Merges the test and training data frames.
5. Creates a data frame with a subset of the feature columns that only include data with means and standard deviations.
6. Aggregates the resulting data to give averages of the feature columns grouped by activity and subject.
7. Prints the aggregated data.

## Instructions to run the *run_analysis.R* script

1. Download the data set from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 
2. Extract the contents of the zip file into a folder and navigate to the top folder where the file features.txt exists. There should be a test folder and a train folder with the test and train data.
3. Copy the script run_analysis.R to this folder.
4. Start R or RStudio.
5. Make sure that you have installed the R **dplyr** package.
5. Set the working directory to the folder where the features.txt exists.
6. Run the script within your R environment by executing the command 
  `source("run_analysis.R")`
7. Succesful execution of the script should result in the print out of the tidy data set.
