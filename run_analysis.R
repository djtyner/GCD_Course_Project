## This R-program uses data collected from accelerometers from the Samsung Galaxy S smartphone.
##   It will import the data into then accomplish the following (as set forth in the project
##   instructions for the Getting and Cleaning Data course):
##        1) merge the training data sets and the test data sets to create one data set;
##        2) extract ONLY the measurements on the mean and standard deviation for each measurement;
##        3) use DESCRIPTIVE activity names to name the activities in the data set;
##        4) appropriately label the data set with descriptive variable names; and
##        5) from the data set in step 4,create a second, independent tidy data set with the 
##           average of each variable for each activity and each subject.
##
##
##
##
##
## This program assumes that all files are in the R working directory.  So, assuming that you have
##   already downloaded the data folder (and included files) from the given website, you'll want
##   to ensure that the following files are in your R working directory (note: use pwd(), setwd() 
##   if necessary):
##        1) X_test.txt, y_test.txt, subject_test.txt
##        2) X_train.txt, y_train.txt, subject_train.txt
##        3) activity_labels.txt, features.txt
##
########################################################################################################################
## Read the data from the "test" group using the read.table() function. Note that the I am changing
##   from upper case X to lower case x to maintain consistency in data frame names.  Plus, it is 
##   extremely difficult to see the difference between X and x in R!
x_test <- read.table("X_test.txt")               ## test data set (2947 rows, 561 columns)
y_test <- read.table("y_test.txt")               ## test data labels - from 1 thru 6 (2947 rows, 1 column)
subject_test <- read.table("subject_test.txt")   ## subject who performed activity - from 1 thru 30 (2947 rows, 1 column)
##
## Bind the columns from the 3 test data files together.
test_data1 <- cbind(x_test, y_test)              ## 562 columns
test_data <- cbind(test_data1, subject_test)     ## 563 columns
##
##
##
## Read the data from the "training" group using the read.table() function. Note again that the I am changing
##   from upper case X to lower case x to maintain consistency in data frame names.
x_train <- read.table("X_train.txt")             ## training data set (7352 rows, 561 columns)
y_train <- read.table("y_train.txt")             ## training data labels - from 1 thru 6 (7352 rows, 1 column)
subject_train <- read.table("subject_train.txt") ## subject who performed activity - from 1 thru 30 (7352 rows, 1 column)
##
## Bind the columns from the 3 training data files together.
train_data1 <- cbind(x_train, y_train)           ## 562 columns
train_data <- cbind(train_data1, subject_train)  ## 563 columns
########################################################################################################################
## Now, bind the rows of the test data with the rows of the training data.  The resulting data frame will 
##   have 2947 + 7352 = 10299 rows and 563 columns.
##
data <- rbind(test_data, train_data)
########################################################################################################################
##   Read in the information from the features.txt file and use that information to create names for the first
##     561 columns of "data".
features <- read.table("features.txt")          ## 561 rows, 2 columns
##
##  The second column of features contains the categories of the columns of "data".  But, the
##    2nd column is a factor column.  Let's convert the factors to characters so that we can
##    use the column data as names for the "data" data frame, and let's assign the character 
##    names to a new variable called column_names.
column_names1 <- as.character(features$V2)
##
##  We need to append two more values for names that we want for the two additional columns that
##    we appended to the training and test data frames.
column_names <- c(column_names1, "ActivityNumber", "SubjectNumber")
##
## Use the column_names vector to assign names to the columns of the "data" data frame.
names(data) <- column_names
########################################################################################################################
## Find all the column names that have the following character strings: mean(), std().  First create
##   a logical vector that is TRUE when the column name contains the text "mean()".  Then create a
##   logical vector that is TRUE when the column name contains the text "std()".
logical_mean <- grepl("mean\\(\\)", names(data))
logical_std <- grepl("std\\(\\)", names(data))
##
## Combine the two vectors using the OR function so that the resulting vector will be TRUE when
##   mean() OR std() is found in the column name.
logical_mean_or_std <- logical_mean | logical_std
##
## We will use logical_mean_or_std to subset the "data" data frame, but we still want to include the 
##   ActivityNumber column and the SubjectNumber columns (columns 562 and 563).  So, we'll create
##   a logical subsetting vector that has a value of TRUE for the 562nd and 563rd entries.
logical <- logical_mean_or_std
logical[562:563] <- TRUE
##
## Now subset the data vector to maintain ONLY columns that have names containing "mean()", "std()",
##   "ActivityNumber", "SubjectNumber"
data_subset <- data[,logical]
#######################################################################################################################
## Read in the information from the activity_labels.txt data file.  This file provides a code that
##   relates a uniques numerical value to each of the six activities.
activity_labels <- read.table("activity_labels.txt")          ## 6 rows, 2 columns
##
## Use the information in the "activity_labels" data frame to create a column in the "data_subset"
##   data frame that contains the "activity name" (e.g STANDING, LAYING, etc.).  We start by giving the
##   first column in "activity_labels" the name "ActivityNumber".  In this way, we can join the 
##   "datasubset" and the "activity_labels" data frames with by = "ActivityNumber".
names(activity_labels) <- c("ActivityNumber", "Activity")
data_subset2 <- join(data_subset, activity_labels)  ## defaults: by="ActivityNumber", type="left", match="all"
##
## Remmove the ActivityNumber ccolumn (column 67) since it now contains redundant information.
data_subset3 <- data_subset2[,-67]
#######################################################################################################################
## Create the final tidy data table that has the means of all other columns of the data frame
##   "data_subset3" when grouped by Activity and SubjectNumber. 
library(plyr)
data_final <- ddply(data_subset3, .(Activity,SubjectNumber), numcolwise(mean))
##
## Per the instructions, create a .txt file with the write.table() function so that it can be
##   uploaded to Github.
write.table(data_final, file="output_data.txt", row.names=FALSE)
#######################################################################################################################