# Code_Book

The information that follows was taken from the "README.txt" and "features_info.txt" files that were included with the data that was used for this project.  Where appropriate, the text will mimic that of the original authors of those two files, and modifications to the text will be included to 
* eliminate information about data that was not directly used for this project;
* provide my attempt to clarify their terminology (assuming that I am understanding their work and their documentation of it);
* indicate any variables and summaries that are a result of the execution of my run_analysis.R code.  
The work of the original authors is not intended to be plagiarized, rather it is included here for accuracy (since some of their work is completely foreign to me!).

## From "README.txt"
Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
### Experiment Description
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% of the volunteers were selected for the test data.
NOTE: the process of selecting the two groups is not stated by the orignal authors anywhere in the two files. 

The sensor signals (accelerometer sensor signals and gyroscope sensor signals) were pre-processed by applying noise filters and then were sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into two components: body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record, the following data was recorded:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label.
	1. 1 - WALKING
	2. 2 - WALKING UPSTAIRS
	3. 3 - WALKING DOWNSTAIRS
	4. 4 - SITTING
	5. 5 - STANDING
	6. 6 - LAYING 
* A numerical identifier of the subject who carried out the experiment (numbers 1 thru 30)

The dataset includes the following files:
* "README.txt"
* "features_info.txt": gives information about the variables used on the feature vector.
* "features.txt": gives names of the 561 data measurements that were recorded for each record.
* "activity_labels.txt": Links the class number with their activity name.
* "train/X_train.txt": Training set.
* "train/y_train.txt": Training labels.
* "test/X_test.txt": Test set.
* "test/y_test.txt": Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
* "train/subject_train.txt": Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


Notes: 
* Features are normalized and bounded within [-1,1].
* Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
* Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

* [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

* This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


## From "features_info.txt
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals was calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
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

The set of variables that were estimated from these signals are: 
* mean(): Mean value
* std(): Standard deviation

Additional vectors were obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

## Transformations and Worked Performed
1. The columns of the test data and the training data were provided with labels/names that were given in the "features.txt" file.  These are the names used by the experimenters who originally documented the work.
2. The test data and training data were appended with two additional columns of data.  In its raw form, the data for these two additional columns was included in separate files.  In particular, the data indicated information about the particular activity (e.g. WALKING, SITTING, etc.) and the number assigned to the subject under study (e.g. 1, 2, ..., 30).
3. The rows of the test data and the training data were appended to form a single data frame that contained data from all experiments (test and training).
4. Columns of measurement data that did not contain the text "mean()' or (std()" in their column name were discarded.  The resulting data frame contained only data with columns that "indicated" the data was either a mean value or a standard deviation.  Additionally, the two appended columns of item 2 above were also retained.
5. An new column was appended to the data frame.  This new column contained the activity name that was affiliated with the activity number.  After the activity name column was created, the column that contained the activity number was removed, since it contained redundant information.
6. The final tidy data frame was created by computing the average (i.e. mean) of each of the data variables, and this was summarized by activity (e.g. SITTING, etc.) and subject number (e.g 1, thru 30).  