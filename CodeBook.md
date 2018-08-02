## Intro
This document describes all the operation performed on the following dataset

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


# Here are the computing steps 

- If necessary download and unzip the dataset
- Merges the training and the test sets to create one data set.
	- Import feature list
	- Import and merge Features labeled with feature name from feature list
  	- Import and merge Labels in a "labelindex" column
	- Import and merge subjects in a "subject" column
	- Aggregate all subjects,features and labels in a single table FullDF and remove old tables
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
	- Import activity lables
	- Merge with FullDF on labelindex and drop labelindex column
- Appropriately labels the data set with descriptive variable names	
 	- remove abreviations
	- set to lower case
	- remove special characters
- From FullDF, creates a second data frame, independent tidy data set (FullDF.tidy) with the average of each variable for each activity and each subject.