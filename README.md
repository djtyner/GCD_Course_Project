# GCD_Course_Project
This repository contains the material for the Getting and Cleaning Data course project.


For completeness of understanding, the instructions for the project (as given in the course) are repeated here.
## Project Instructions
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example  this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Good luck!

## Explanation of run_analysis.R
Though there are comments throughout the run_analysis.R file about what the code does, they will be summarized here.

Before executing the R code, you should ensure:
* you have installed the dplyr package; and
* the following files (from the "data for the project") are in your R working directory: X_test.txt (561 columns), y_test.txt (1 column), subject_test.txt (1 column); X_train.txt (561 columns), y_train.txt (1 column), subject_train.txt (1 column; activity-labels.txt (6 rows, 2 columns), features.txt (563 rows, 2 columns).

### R code: Step 1
* Reads in the "test" data from the 3 "test" files and combines the data with cbind so that the test data is all in one data frame (called "test_data" with 563 columns).
* Reads in the "train" data from the 3 "train" files and combines the data with cbind so that the training data is all in one data frame (called "train_data" with 563 columns).

### R code: Step 2
* Appends the rows of the training data to the test data with rbind to create one data set (called "data" with 563 columns) {as per item 1 of the project requirements}.

### R code: Step 3
* Reads in the data from the features.txt file.  The features.txt file contains information about the data found in the columns of the X_test and X_train text files.  In actuality, this is information that will be used to name most of the columns in the "data" data frame. 
* Converts  the descriptive names from the features file from factor form to character form.
* Combines the character names with "ActivityNumber" and "SubjectNumber" and uses the combined information to name the columns of the "data" data frame with descriptive names {as per item 4 of the project requirements}.

### R Code: Step 4
* Subsets the "data" data frame by finding columns that have "mean()" or "std()" in their column name {as per item 2 of the project requirements}.  The reduced data frame is called "data_subset".

### R Code: Step 5
* Reads in the data from the activity_labels text file, which provides a code relating each of the 6 activity numbers with a particular descriptive activity name.
* Replaces the activity number in the "data_subset" data frame with the corresponding descriptive activity name {as per item 3 of the project requirements}.
* Removes the column in the "data_subset" data frame that contains the Activity Number. 

### R Code: Step 6
* Creates another data frame (called "data_final") from the already subsetted data frame that contains the mean of each variable for each activity and each subject.
* Writes the "data_final" data frame to your R working directory in a file named "output_data.txt".