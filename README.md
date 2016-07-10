# GettingAndCleaningDataProject
Getting and Cleaning Data Course Project Assignment

This GIT repository contains the files that were created for the Getting and Cleaning Data Course Project Assignment.
The files included are (besides this README)

1. run_analysis.R
2. CodeBook.md

The script provided here is to be used on the Smartphone accelerometers data collected based on Human activity and available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. The details on the data collected is avilable at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

## Instructions to run the *run_analysis.R* script

1. Download the data for this project from the link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Extract the contents of the zip file into a folder and navigate to the top folder where the file features.txt exists. There should be a test folder and a train folder with the test and train data.
3. Copy the script run_analysis.R to this folder.
4. Start R or RStudio.
5. Make sure that you have installed the R **dplyr** package.
5. Set the working directory to the folder where the features.txt exists.
6. Run the script within your R environment by executing the command
    ### source("run_analysis.R") ###
7. Succesful execution of the script should result in the print out of the tidy data set.
