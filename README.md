# Getting-and-Cleaning-Data-Week-4-Assignment
In this repository, we will be doing the final course project of Getting and Cleaning Data.

The first step is to download and unzip the data file into our R working directory.
And the last step would be to execute R source code to generate a tidy data file.

# Data description
In data X, the variables are sensor signals which are measured with waist-mounted smartphone from 30 subjects. In data Y, the variables indicate the activity type that the subjects performed during recording.

# Code explaination
In The code, we combined training dataset and test dataset. From there we extracte partial variables to create another dataset which has the averages of each variable for each activity.

# New dataset
The new generated dataset contained variables calculated based on the mean and standard deviation. Each row of the dataset is an average of each activity type for all subjects.

## The code was written based on the instruction of this assignment
Read training and test dataset into R environment. Read variable names into R envrionment. Read subject index into R environment.

Merges the training and the test sets to create one data set. Use command rbind to combine training and test set
Extracts only the measurements on the mean and standard deviation for each measurement. Use grep command to get column indexes for variable name contains "mean()" or "std()"
Uses descriptive activity names to name the activities in the data set Convert activity labels to characters and add a new column as factor
Appropriately labels the data set with descriptive variable names. Give the selected descriptive names to variable columns
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Use pipeline command to create a new tidy dataset with command group_by and summarize_each in dplyr package
